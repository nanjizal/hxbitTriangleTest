package;
import hxbit.Serializable;

class TriangleSimple implements hxbit.Serializable {
    
    @:s public var ax: Float;
    @:s public var ay: Float;
    @:s public var bx: Float;
    @:s public var by: Float;
    @:s public var cx: Float;
    @:s public var cy: Float;
    @:s public var alpha: Float = 1. ;
    @:s public var colorID: Int = 0xFF000000;
    public function new( ax_: Float, ay_: Float
                       , bx_: Float, by_: Float
                       , cx_: Float, cy_: Float ){
        ax = ax_;
        ay = ay_;
        bx = bx_;
        by = by_;
        cx = cx_;
        cy = cy_;
    }

    public function toString(): String {
        return ( 'triangle\n' + '  ax: ' + ax + ' , ay: ' + ay 
                            + '\n, bx: ' + bx + ' , by: ' + by 
                            + '\n, cx: ' + cx + ' , cy: ' + cy 
                            + '\n alpha: ' + alpha 
                            + '\n colorID ' + colorID
                            + '\n');
    }
}
