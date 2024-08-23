
params ["_base"];
_trigger = _base getVariable "_trigger";
	
/** Get an array of objects within a trigger area */
_getObjectsInTrigger = {
	params ["_trigger"];
	_area = triggerArea _trigger;
	_isRectangle = _area select 3;
	_a = _area select 0;
	_b = _area select 1;

	_radius = 0;
	if (_isRectangle) then {
		if (_a > _b) then {
			_radius = 2 * _a; // 2x is faster than figuring out sqrt(_a^2 + _b^2)
		} else {
			_radius = 2 * _b; // 2x is faster than figuring out sqrt(_a^2 + _b^2)
		};
	} else {
		if (_a > _b) then {
			_radius = _a;
		} else {
			_radius = _b;
		};
	};

	_near = nearestObjects [getPos _trigger, ["All"], _radius, true];
	_inside = _near select {_x != _trigger && _x inArea _trigger};
	_inside;
};

{
	deleteVehicle _x;
} forEach ([_trigger] call _getObjectsInTrigger select { _x != _trigger && _x != _base});
deleteVehicle _trigger;
deleteVehicle _base;
