package;
import hxbit.Serializable;

class TriangleSimple implements hxbit.Serializable {
    
    @:s public var ax: Float;
    @:s public var ay: Float;
    @:s public var bx: Float;
    @:s public var by: Float;
    @:s public var cx: Float;
    @:s public var cy: Float;
    public var bitLength: Int = 0;
    public var alpha: Float = 1. ;
    public var colorID: Int = 0xFF000000;
    public var textureID: Int = -1; 
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
        bitLength = 1 << 2;
        // store bits that need adding.
        ctx.addInt( bitLength );
        ctx.addFloat( alpha );
        ctx.addInt( colorID );
        ctx.addInt( textureID );
    }
    inline public function add( mask: Int ){
            bitLength = bitLength | mask;
    }
    inline public static function contains( bits :Int, mask :Int ) :Bool{
            return bits & mask != 0;
    }
    @:keep
    public function customUnserialize(ctx : hxbit.Serializer) {
        bitLength = ctx.getInt();
        if( bitLength == 0 ) return;
        alpha       = ctx.getFloat();
        colorID     = ctx.getInt();
        textureID   = ctx.getInt();
    }
    public function toString(): String {
        return ( 'triangle\n' + '  ax: ' + ax + ' , ay: ' + ay 
                            + '\n, bx: ' + bx + ' , by: ' + by 
                            + '\n, cx: ' + cx + ' , cy: ' + cy 
                            + '\n alpha: ' + alpha 
                            + '\n colorID ' + colorID
                            + '\n textureID ' + textureID  + '\n');
    }
}