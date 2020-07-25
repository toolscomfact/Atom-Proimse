// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
globalvar promise;

promise = function() constructor{
	
	ReturnStruct =  {
		_method_callstack : 0,
		_methods : ds_list_create(),
		_method_catch : 0,
		ReturnStruct : -1,
		
		TNCallback : function(){
			show_debug_message("[WARNING!] There is no more methods!");
		},
		
		Callback : function(param){
			_method_callstack ++;
						
			var nextMethod = noone;
			if (_method_callstack < ds_list_size(_methods)){
				nextMethod = _methods[| _method_callstack];
			}else{
				TNCallback();
			}
						
			if (nextMethod != noone){
				nextMethod(Callback, param);
			}
		},
		
		Then : function (_method){
			ds_list_add(_methods, _method);
		
			return ReturnStruct;
		},
		Catch : function (_catch){
			_method_catch = _catch;
			
			return ReturnStruct;
		},
		Go : function (){
			try{
			    var nowMethod = _methods[|_method_callstack];
					
				nowMethod(Callback);
			}catch (except){
				_method_catch(except);
			}
		}
	};
	
	ReturnStruct.ReturnStruct = ReturnStruct;
	Then = ReturnStruct.Then;
}

new promise()
.Then(function(callback) {
	show_message("해위");
	callback(10);
})
.Then(function(callback, param){
	show_message("ㅋㅋ ㅠㅠ");
	callback();
})
.Catch(function() {
	show_message("에러 ^~^");
})
.Go();