import Foundation
#if os(Linux) || os(Android) || os(Windows)
import zlibLinux
#else
import zlib
#endif

internal typealias InflateInit = (UnsafeMutablePointer<z_stream>?, Int32, UnsafePointer<CChar>?, Int32) -> Int32

internal extension Data {
    func gunzippedData(inflateInit: InflateInit = inflateInit2_) throws -> Data {
        var stream = z_stream()
        try withUnsafeBytes { bytes in
            guard let pointer = bytes.bindMemory(to: Bytef.self).baseAddress else { throw GunzipError.decompressFailed }
            stream.next_in = UnsafeMutablePointer<Bytef>(mutating: pointer)
        }
        stream.avail_in = uInt(count)
        stream.total_out = 0
        guard inflateInit(&stream, MAX_WBITS + 16, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size)) == Z_OK else {
            throw GunzipError.decompressFailed
        }
        
        var decompressed = Data(capacity: count * 2)
        while stream.avail_out == 0 {
            let gzipBufferLength = 512
            stream.avail_out = uInt(gzipBufferLength)
            decompressed.count += gzipBufferLength
            
            try decompressed.withUnsafeMutableBytes { (bytes: UnsafeMutableRawBufferPointer) in
                stream.next_out = bytes
                    .bindMemory(to: Bytef.self)
                    .baseAddress?
                    .advanced(by: Int(stream.total_out))
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
