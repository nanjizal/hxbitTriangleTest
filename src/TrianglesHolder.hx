package;
import hxbit.Serializable;
class TrianglesHolder implements hxbit.Serializable {
    @:s public var triangles: Array<Triangle>;
    public function new(){}
    public function toString(): String {
        var out = '\nTriangles:\n';
        for( i in 0...triangles.length ) { out += triangles[ i ].toString(); };
        return out;
    }
}