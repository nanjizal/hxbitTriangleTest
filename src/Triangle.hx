package;
import hxbit.Serializable;

class Triangle implements hxbit.Serializable {
    @:s public var ax: Float;
    @:s public var ay: Float;
    @:s public var bx: Float;
    @:s public var by: Float;
    @:s public var cx: Float;
    @:s public var cy: Float;
    public var alpha: Float = 1. ;
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
    @:keep
    public function customSerialize(ctx : hxbit.Serializer) {
        if( alpha != 1. ) ctx.addFloat( alpha );
    }
    @:keep
    public function customUnserialize(ctx : hxbit.Serializer) {
        var alpha_ = ctx.getFloat();
        if( alpha_ != null ){ // OPTIMISTIC 
            alpha = alpha_;
        }
    }
    public function toString(): String {
        return ( 'triangle\n' + '  ax: ' + ax + ' , ay: ' + ay 
                            + '\n, bx: ' + bx + ' , by: ' + by 
                            + '\n, cx: ' + cx + ' , cy: ' + cy 
                            + '\n alpha: ' + alpha + '\n' );
    }
}