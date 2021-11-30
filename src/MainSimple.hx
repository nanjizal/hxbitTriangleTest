import sys.io.File;
import sys.io.FileInput;
import sys.io.FileOutput;
import haxe.io.Bytes;
import hxbit.Serializer;
import Triangle;
import TrianglesHolder;
class MainSimple {
    static function main() {
        var fname = "triangleData.dat";
        // open file for writing
        var fout = File.write( fname, true );
        // create data for serialization
        var triangle0 = new Triangle( 10, 10, 100, 10, 50, 100 );
        triangle0.alpha = 0.5;
        triangle0.textureID = 1;
        var triangle1 = new Triangle( 100, 10, 200, 10, 150, 100 );
        triangle1.alpha = 0.7;
        triangle1.colorID = 1;
        var trianglesOut = [ triangle0, triangle1 ];
        var tri: Triangle;
        for( i in 0...2 ){
            tri = new Triangle( Math.random()*500, Math.random()*500
                              , Math.random()*500, Math.random()*500
                              , Math.random()*500, Math.random()*500 );
            trianglesOut.push( tri );
        }
        var trianglesHolder = new TrianglesHolder();
        trianglesHolder.triangles = trianglesOut;
        // serialize
        var s = new hxbit.Serializer();
        var bytesOut = s.serialize( trianglesHolder );
        // write to file
        fout.writeBytes( bytesOut, 0, bytesOut.length );
        fout.close();
        try{
            // get bytes from file
            var bytesIn = File.getBytes( fname );
            // setup deserializer
            var u = new hxbit.Serializer();
            // delerialize to TriangleHolder
            var trianglesIn: TrianglesHolder = u.unserialize( bytesIn, TrianglesHolder );
            // print result 
            trace( trianglesIn );
        } catch( e : Dynamic ){
            trace('broken');
        }
    }
}