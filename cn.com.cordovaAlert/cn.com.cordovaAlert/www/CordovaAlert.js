/**
 *	
 */
 var CordovaAlert = {

	//启用alert弹框，参数分别为弹框标题，弹框内容，和按钮文字(注意没有失败回调)
    startAlert: function(successCallback,alertTitle,alertMessage,buttonContent){
 	cordova.exec(successCallback, function(){}, 'AlertPlugin',
 		'startAlert', [alertTitle,alertMessage,buttonContent]);
    },
	//confirm弹框，参数分别为弹框标题，内容，成功回调的按钮标题，失败回调的按钮标题
    startConfirm: function(successCallback, failureCallback , confirmTitle,confirmMessage ,successButtonContent ,cancelButtonContent){
        cordova.exec(successCallback, failureCallback, 'AlertPlugin',
                'startConfirm',[confirmTitle,confirmMessage ,successButtonContent ,cancelButtonContent]);
    }
 };

 module.exports = CordovaAlert;

