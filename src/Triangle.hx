package;
import hxbit.Serializable;

@:enum abstract Store(Int) from Int to Int{
    var ALPHA              = 1 << 0;
    var COLOR_ID           = 1 << 1;
    var TEXTURE_ID         = 1 << 2;
}

class Triangle implements hxbit.Serializable {
    
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
        var needsAlpha      = ( alpha   != 1. );
        var needsColorID    = ( colorID != 0xFF000000 );
        var needsTextureID  = ( textureID != -1 );
        bitLength = 0;
        if( needsAlpha )      add( ALPHA );
        if( needsColorID )    add( COLOR_ID );
        if( needsTextureID )  add( TEXTURE_ID );
        // store bits that need adding.
        ctx.addInt( bitLength );
        if( needsAlpha )      ctx.addFloat( alpha );
        if( needsColorID )    ctx.addInt( colorID );
        if( needsTextureID )  ctx.addInt( textureID );
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
        if( contains( bitLength, ALPHA ) )      alpha       = ctx.getFloat();
        if( contains( bitLength, COLOR_ID ) )   colorID     = ctx.getInt();
        if( contains( bitLength, TEXTURE_ID ) ) textureID   = ctx.getInt();
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