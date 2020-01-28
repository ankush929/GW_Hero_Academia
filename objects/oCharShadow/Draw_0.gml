/// @description Draw Shadow and its size

/// -------- Size calculations --------------
#region Size calc
// Calc and draw shadow_size according the z value. At more negative z (higher jump), less shadow size
var distMult = 1 - abs((parId.z - z)/100);	// Multiplier to the distance between Player and Shadow
var sZ = abs(z + y);						// Shadow Z
if (parId.z - z) = 0 
	var pZ = abs((parId.z) + y);			// Player Z when grounded
else
	var pZ = abs((parId.z) + y)*distMult;	// Player Z when on air

shadow_size = clamp((pZ/sZ), 0, 1);			// Shadow size relative to the distance between Player Z and Shadow Z
#endregion
/// -----------------------------------------

//draw_text(x,y, string(lastColZ) + "|" + string(obj) + "\n" + string((y - yCol) + z));		// Only debug purposes
drawShadow();	// Draw shadow position relative to Z pisition