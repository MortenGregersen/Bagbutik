import Foundation
#if os(Linux)
import zlibLinux
#else
import zlib
#endif

internal extension Data {
    func gunzippedData() throws -> Data {
        var stream = z_stream()
        try withUnsafeBytes { bytes in
            guard let pointer = bytes.bindMemory(to: Bytef.self).baseAddress else { throw GunzipError.decompressFailed }
            stream.next_in = UnsafeMutablePointer<Bytef>(mutating: pointer)
        }
        stream.avail_in = uInt(count)
        stream.total_out = 0
        guard inflateInit2_(&stream, MAX_WBITS + 16, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size)) == Z_OK else {
            throw GunzipError.decompressFailed
        }
        
        var decompressed = Data(capacity: count * 2)
        while stream.avail_out == 0 {
            let gzipBufferLength = 512
            stream.avail_out = uInt(gzipBufferLength)
            decompressed.count += gzipBufferLength
            
            try decompressed.withUnsafeMutableBytes { (bytes: UnsafeMutableRawBufferPointer) in
                guard let pointer = bytes.bindMemory(to: Bytef.self).baseAddress else {
                    throw GunzipError.decompressFailed
                }
                let newPointer = UnsafeMutablePointer<Bytef>(mutating: pointer)
                stream.next_out = newPointer.advanced(by: Int(stream.total_out))
            }
            
            let status = inflate(&stream, Z_SYNC_FLUSH)
            if status != Z_OK, status != Z_STREAM_END {
                break
            }
        }
        
        if inflateEnd(&stream) != Z_OK { throw GunzipError.decompressFailed }
        
        decompressed.count = Int(stream.total_out)
        return decompressed
    }
}

internal enum GunzipError: Error {
    case decompressFailed
}
