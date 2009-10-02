I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;46799;
CPBorderlessWindowMask=0;
CPTitledWindowMask=1<<0;
CPClosableWindowMask=1<<1;
CPMiniaturizableWindowMask=1<<2;
CPResizableWindowMask=1<<3;
CPTexturedBackgroundWindowMask=1<<8;
CPBorderlessBridgeWindowMask=1<<20;
CPHUDBackgroundWindowMask=1<<21;
CPWindowNotSizable=0;
CPWindowMinXMargin=1;
CPWindowWidthSizable=2;
CPWindowMaxXMargin=4;
CPWindowMinYMargin=8;
CPWindowHeightSizable=16;
CPWindowMaxYMargin=32;
CPBackgroundWindowLevel=-1;
CPNormalWindowLevel=0;
CPFloatingWindowLevel=3;
CPSubmenuWindowLevel=3;
CPTornOffMenuWindowLevel=3;
CPMainMenuWindowLevel=24;
CPStatusWindowLevel=25;
CPModalPanelWindowLevel=8;
CPPopUpMenuWindowLevel=101;
CPDraggingWindowLevel=500;
CPScreenSaverWindowLevel=1000;
CPWindowOut=0;
CPWindowAbove=1;
CPWindowBelow=2;
CPWindowWillCloseNotification="CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification="CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification="CPWindowDidResignMainNotification";
CPWindowDidMoveNotification="CPWindowDidMoveNotification";
CPWindowShadowStyleStandard=0;
CPWindowShadowStyleMenu=1;
CPWindowShadowStylePanel=2;
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil;
var _9=objj_allocateClassPair(CPResponder,"CPWindow"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_shadowStyle"),new objj_ivar("_supportsMultipleDocuments"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_DOMElement"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPResponder")},"init");
if(_b){
var _f=objj_msgSend(objj_msgSend(_b,"class"),"_windowViewClassForStyleMask:",_e);
_frame=objj_msgSend(_f,"frameRectForContentRect:",_d);
objj_msgSend(_b,"_setSharesChromeWithPlatformWindow:",!objj_msgSend(CPPlatform,"isBrowser"));
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
}else{
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"initWithContentRect:",_frame));
objj_msgSend(_b,"platformWindow")._only=_b;
}
_isFullPlatformWindow=NO;
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_b;
_styleMask=_e;
objj_msgSend(_b,"setLevel:",CPNormalWindowLevel);
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
_windowView=objj_msgSend(objj_msgSend(_f,"alloc"),"initWithFrame:styleMask:",CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)),_e);
objj_msgSend(_windowView,"_setWindow:",_b);
objj_msgSend(_windowView,"setNextResponder:",_b);
objj_msgSend(_b,"setMovableByWindowBackground:",_e&CPHUDBackgroundWindowMask);
objj_msgSend(_b,"setContentView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
_firstResponder=_b;
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.zIndex=0;
if(!objj_msgSend(_b,"_sharesChromeWithPlatformWindow")){
if(NULL){
var _10=_CGPointApplyAffineTransform(CGPointMake((_frame.origin.x),(_frame.origin.y)),NULL);
}else{
var _10={x:(_frame.origin.x),y:(_frame.origin.y)};
}
_DOMElement.style.left=ROUND(_10.x)+"px";
_DOMElement.style.top=ROUND(_10.y)+"px";
}
_DOMElement.style.width=MAX(0,ROUND(1))+"px";
_DOMElement.style.height=MAX(0,ROUND(1))+"px";
_DOMElement.appendChild(_windowView._DOMElement);
objj_msgSend(_b,"setNextResponder:",CPApp);
objj_msgSend(_b,"setHasShadow:",_e!==CPBorderlessWindowMask);
if(_e&CPBorderlessBridgeWindowMask){
objj_msgSend(_b,"setFullPlatformWindow:",YES);
}
_defaultButtonEnabled=YES;
_keyViewLoopIsDirty=YES;
}
return _b;
}
}),new objj_method(sel_getUid("platformWindow"),function(_11,_12){
with(_11){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_13,_14,_15){
with(_13){
_platformWindow=_15;
}
}),new objj_method(sel_getUid("setSupportsMultipleDocuments:"),function(_16,_17,_18){
with(_16){
_18=!!_18;
_supportsMultipleDocuments=_18;
}
}),new objj_method(sel_getUid("supportsMultipleDocuments"),function(_19,_1a){
with(_19){
return _supportsMultipleDocuments;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_1b,_1c){
with(_1b){
if(_initialFirstResponder){
objj_msgSend(_1b,"makeFirstResponder:",_initialFirstResponder);
}
_keyViewLoopIsDirty=!objj_msgSend(_1b,"_hasKeyViewLoop");
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_1d,_1e,_1f){
with(_1d){
if(_windowView===_1f){
return;
}
var _20=_windowView;
_windowView=_1f;
if(_20){
objj_msgSend(_20,"_setWindow:",nil);
objj_msgSend(_20,"noteToolbarChanged");
_DOMElement.removeChild(_20._DOMElement);
}
if(_windowView){
_DOMElement.appendChild(_windowView._DOMElement);
var _21=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_21.origin=objj_msgSend(_1d,"convertBaseToGlobal:",_21.origin);
objj_msgSend(_windowView,"_setWindow:",_1d);
objj_msgSend(_windowView,"setNextResponder:",_1d);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_1d,"setFrame:",objj_msgSend(_1d,"frameRectForContentRect:",_21));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_22,_23,_24){
with(_22){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_24=!!_24;
if(_isFullPlatformWindow===_24){
return;
}
_isFullPlatformWindow=_24;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_22,"contentRectForFrameRect:",objj_msgSend(_22,"frame")),objj_msgSend(_22,"hasShadow"),objj_msgSend(_22,"level"));
var _25=objj_msgSend(objj_msgSend(_22,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_26=objj_msgSend(objj_msgSend(_25,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_22,"_setWindowView:",_26);
objj_msgSend(_22,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_22,"setHasShadow:",NO);
objj_msgSend(_22,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_22,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _26=_fullPlatformWindowSession.windowView;
objj_msgSend(_22,"_setWindowView:",_26);
objj_msgSend(_22,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_22,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_22,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_22,"setFrame:",objj_msgSend(_26,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_27,_28){
with(_27){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_29,_2a){
with(_29){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_2d);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_windowView,"frameRectForContentRect:",_30);
}
}),new objj_method(sel_getUid("frame"),function(_31,_32){
with(_31){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_33,_34,_35,_36,_37){
with(_33){
if(_37){
var _38=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_33,_35);
objj_msgSend(_38,"startAnimation");
}else{
var _39=_frame.origin,_3a=_35.origin;
if(!(_39.x==_3a.x&&_39.y==_3a.y)){
_39.x=_3a.x;
_39.y=_3a.y;
if(!objj_msgSend(_33,"_sharesChromeWithPlatformWindow")){
if(NULL){
var _3b=_CGPointApplyAffineTransform(CGPointMake(_39.x,_39.y),NULL);
}else{
var _3b={x:_39.x,y:_39.y};
}
_DOMElement.style.left=ROUND(_3b.x)+"px";
_DOMElement.style.top=ROUND(_3b.y)+"px";
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_33);
}
var _3c=_frame.size,_3d=_35.size;
if(!(_3c.width==_3d.width&&_3c.height==_3d.height)){
_3c.width=MIN(MAX(_3d.width,_minSize.width),_maxSize.width);
_3c.height=MIN(MAX(_3d.height,_minSize.height),_maxSize.height);
objj_msgSend(_windowView,"setFrameSize:",_3c);
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_3c.width+_2,height:_4+_3c.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_33);
}
}
if(objj_msgSend(_33,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentRect:",_frame);
}
}
}
}),new objj_method(sel_getUid("setFrame:display:"),function(_3e,_3f,_40,_41){
with(_3e){
objj_msgSendSuper({receiver:_3e,super_class:objj_getClass("CPResponder")},"setFrame:display:animate:",_40,_41,NO);
}
}),new objj_method(sel_getUid("setFrame:"),function(_42,_43,_44){
with(_42){
objj_msgSend(_42,"setFrame:display:animate:",_44,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_45,_46,_47){
with(_45){
objj_msgSend(_45,"setFrame:display:animate:",{origin:{x:_47.x,y:_47.y},size:{width:(_frame.size.width),height:(_frame.size.height)}},YES,NO);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"setFrame:display:animate:",{origin:{x:(_frame.origin.x),y:(_frame.origin.y)},size:{width:_4a.width,height:_4a.height}},YES,NO);
}
}),new objj_method(sel_getUid("orderFront:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_platformWindow,"orderFront:",_4b);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_4b,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_4e,_4f,_50){
with(_4e){
}
}),new objj_method(sel_getUid("orderOut:"),function(_51,_52,_53){
with(_51){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_51);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_51,nil);
if(objj_msgSend(CPApp,"keyWindow")==_51){
objj_msgSend(_51,"resignKeyWindow");
CPApp._keyWindow=nil;
}
if(objj_msgSend(_51,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_51);
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_54,_55,_56,_57){
with(_54){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_56,_54,CPApp._windows[_57]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_58,_59,_5a){
with(_58){
_level=_5a;
if(objj_msgSend(_58,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_5a);
}
}
}),new objj_method(sel_getUid("level"),function(_5b,_5c){
with(_5b){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_5d,_5e){
with(_5d){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_5f,_60){
with(_5f){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_63);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_64,_65){
with(_64){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_66,_67,_68){
with(_66){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_68);
}
}),new objj_method(sel_getUid("setContentView:"),function(_69,_6a,_6b){
with(_69){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _6c=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_6b;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_69,"contentRectForFrameRect:",_6c));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_6d,_6e){
with(_6d){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_windowView,"setBackgroundColor:",_71);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_72,_73){
with(_72){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_74,_75,_76){
with(_74){
if(CGSizeEqualToSize(_minSize,_76)){
return;
}
_minSize=CGSizeCreateCopy(_76);
var _77=CGSizeMakeCopy(objj_msgSend(_74,"frame").size),_78=NO;
if(_77.width<_minSize.width){
_77.width=_minSize.width;
_78=YES;
}
if(_77.height<_minSize.height){
_77.height=_minSize.height;
_78=YES;
}
if(_78){
objj_msgSend(_74,"setFrameSize:",_77);
}
}
}),new objj_method(sel_getUid("minSize"),function(_79,_7a){
with(_79){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_7b,_7c,_7d){
with(_7b){
if(CGSizeEqualToSize(_maxSize,_7d)){
return;
}
_maxSize=CGSizeCreateCopy(_7d);
var _7e=CGSizeMakeCopy(objj_msgSend(_7b,"frame").size),_7f=NO;
if(_7e.width>_maxSize.width){
_7e.width=_maxSize.width;
_7f=YES;
}
if(_7e.height>_maxSize.height){
_7e.height=_maxSize.height;
_7f=YES;
}
if(_7f){
objj_msgSend(_7b,"setFrameSize:",_7e);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_80,_81){
with(_80){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_82,_83){
with(_82){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_84,_85,_86){
with(_84){
if(_hasShadow===_86){
return;
}
_hasShadow=_86;
if(objj_msgSend(_84,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_platformWindow,"setHasShadow:",_86);
}
if(_hasShadow){
var _87=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_87)+_2,_3+CGRectGetHeight(_87)+_4));
if(!_6){
var _88=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_88,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_DOMElement.insertBefore(_shadowView._DOMElement,_windowView._DOMElement);
}else{
if(_shadowView){
_DOMElement.removeChild(_shadowView._DOMElement);
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_89,_8a,_8b){
with(_89){
_shadowStyle=_8b;
objj_msgSend(objj_msgSend(_89,"platformWindow"),"setShadowStyle:",_shadowStyle);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_8c,_8d,_8e){
with(_8c){
_delegate=_8e;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _8f=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_8f,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_8c);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_8f,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_8c);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_8f,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_8c);
}
}
}),new objj_method(sel_getUid("delegate"),function(_90,_91){
with(_90){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_92,_93,_94){
with(_92){
_windowController=_94;
}
}),new objj_method(sel_getUid("windowController"),function(_95,_96){
with(_95){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_97,_98,_99){
with(_97){
if(objj_msgSend(_delegate,"respondsToSelector:",_99)){
objj_msgSend(_delegate,"performSelector:",_99);
}else{
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_99);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_9a,_9b){
with(_9a){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_9c,_9d,_9e){
with(_9c){
if(_firstResponder==_9e){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_9e||!objj_msgSend(_9e,"acceptsFirstResponder")||!objj_msgSend(_9e,"becomeFirstResponder")){
_firstResponder=_9c;
return NO;
}
_firstResponder=_9e;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_9f,_a0){
with(_9f){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_a1,_a2){
with(_a1){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_a3,_a4,_a5){
with(_a3){
_acceptsMouseMovedEvents=_a5;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_a6,_a7){
with(_a6){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_a8,_a9,_aa){
with(_a8){
_ignoresMouseEvents=_aa;
}
}),new objj_method(sel_getUid("title"),function(_ab,_ac){
with(_ab){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_ad,_ae,_af){
with(_ad){
_title=_af;
objj_msgSend(_windowView,"setTitle:",_af);
objj_msgSend(_ad,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_b0,_b1,_b2){
with(_b0){
objj_msgSend(_b0,"setRepresentedFilename:",_b2);
objj_msgSend(_b0,"setTitle:",objj_msgSend(_b2,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_b3,_b4,_b5){
with(_b3){
objj_msgSend(_b3,"setRepresentedURL:",_b5);
}
}),new objj_method(sel_getUid("representedFilename"),function(_b6,_b7){
with(_b6){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_b8,_b9,_ba){
with(_b8){
_representedURL=_ba;
}
}),new objj_method(sel_getUid("representedURL"),function(_bb,_bc){
with(_bb){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_bd,_be){
with(_bd){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_bf,_c0,_c1){
with(_bf){
_isMovableByWindowBackground=_c1;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_c2,_c3){
with(_c2){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_c4,_c5){
with(_c4){
var _c6=objj_msgSend(_c4,"frame").size,_c7=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_platformWindow,"contentBounds").size:objj_msgSend(objj_msgSend(_c4,"screen"),"visibleFrame").size;
objj_msgSend(_c4,"setFrameOrigin:",CGPointMake((_c7.width-_c6.width)/2,(_c7.height-_c6.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_c8,_c9,_ca){
with(_c8){
var _cb=objj_msgSend(_ca,"type"),_cc=objj_msgSend(_ca,"locationInWindow");
switch(_cb){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_c8,"firstResponder"),"keyUp:",_ca);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_c8,"firstResponder"),"keyDown:",_ca);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_cc),"scrollWheel:",_ca);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_cc),"mouseUp:",_ca);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_ca);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_cc);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_c8,"makeFirstResponder:",_leftMouseDownView);
}
var _cd=objj_msgSend(_ca,"window");
if(objj_msgSend(_cd,"isKeyWindow")||objj_msgSend(_cd,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_ca);
}else{
objj_msgSend(_c8,"makeKeyAndOrderFront:",_c8);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_ca)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_ca);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_cc),"mouseDragged:",_ca);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_ca);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_ca);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_cc);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_ca);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_ca);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _ce=objj_msgSend(_windowView,"hitTest:",_cc);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_ce){
return objj_msgSend(_ce,"mouseMoved:",_ca);
}
var _cf=_ce,_d0=[];
while(_cf){
_d0.unshift(_cf);
_cf=objj_msgSend(_cf,"superview");
}
var _d1=MIN(_mouseEnteredStack.length,_d0.length);
while(_d1--){
if(_mouseEnteredStack[_d1]===_d0[_d1]){
break;
}
}
var _d2=_d1+1,_d3=_mouseEnteredStack.length;
if(_d2<_d3){
var _d4=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_cc,objj_msgSend(_ca,"modifierFlags"),objj_msgSend(_ca,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_d2<_d3;++_d2){
objj_msgSend(_mouseEnteredStack[_d2],"mouseExited:",_d4);
}
}
_d2=_d1+1;
_d3=_d0.length;
if(_d2<_d3){
var _d4=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_cc,objj_msgSend(_ca,"modifierFlags"),objj_msgSend(_ca,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_d2<_d3;++_d2){
objj_msgSend(_d0[_d2],"mouseEntered:",_d4);
}
}
_mouseEnteredStack=_d0;
objj_msgSend(_ce,"mouseMoved:",_ca);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_d5,_d6){
with(_d5){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_d7,_d8){
with(_d7){
if(_firstResponder!=_d7&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_d9,_da){
with(_d9){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_db,_dc){
with(_db){
return objj_msgSend(CPApp,"keyWindow")==_db;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_dd,_de,_df){
with(_dd){
objj_msgSend(_dd,"orderFront:",_dd);
objj_msgSend(_dd,"makeKeyWindow");
objj_msgSend(_dd,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_e0,_e1){
with(_e0){
if(!objj_msgSend(_e0,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_e0;
objj_msgSend(_e0,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_e2,_e3){
with(_e2){
if(_firstResponder!=_e2&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_e2);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e4,_e5,_e6,_e7,_e8,_e9,_ea,_eb,_ec){
with(_e4){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_e6,_e4,objj_msgSend(_e4,"convertBaseToGlobal:",_e7),_e8,_e9,_ea,_eb,_ec);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_ed,_ee,_ef){
with(_ed){
if(!_ef){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_ef);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_f0,_f1,_f2){
with(_f0){
if(!_f2){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_f2);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f3,_f4,_f5,_f6,_f7,_f8,_f9,_fa,_fb){
with(_f3){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_f5,_f3,objj_msgSend(_f3,"convertBaseToGlobal:",_f6),_f7,_f8,_f9,_fa,_fb);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_fc,_fd,_fe){
with(_fc){
if(!_fe){
return;
}
objj_msgSend(_fc,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_fe);
objj_msgSend(_fc,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_ff,_cmd){
with(_ff){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(self,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(self,_cmd,_105){
with(self){
if(_isDocumentEdited==_105){
return;
}
_isDocumentEdited=_105;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(self,_cmd){
with(self){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(self,_cmd,_10a){
with(self){
if(_isDocumentSaving==_10a){
return;
}
_isDocumentSaving=_10a;
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(self,_cmd){
with(self){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(self,_cmd){
with(self){
if(!objj_msgSend(self,"isMainWindow")){
return;
}
var _10f=objj_msgSend(CPApp,"mainMenu"),_110=objj_msgSend(_10f,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_110==CPNotFound){
return;
}
var item=objj_msgSend(_10f,"itemAtIndex:",_110);
if(_isDocumentSaving){
_7=objj_msgSend(item,"image");
objj_msgSend(item,"setTitle:","Saving...");
objj_msgSend(item,"setImage:",_8);
objj_msgSend(item,"setEnabled:",NO);
}else{
objj_msgSend(item,"setTitle:","Save");
objj_msgSend(item,"setImage:",_7);
objj_msgSend(item,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performClose:"),function(self,_cmd,_114){
with(self){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",self)){
return;
}
}else{
if(objj_msgSend(self,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(self,"windowShouldClose:",self)){
return;
}
}
objj_msgSend(self,"close");
}
}),new objj_method(sel_getUid("close"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,self);
objj_msgSend(self,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(self,_cmd){
with(self){
return objj_msgSend(CPApp,"mainWindow")==self;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(self,_cmd){
with(self){
if(!objj_msgSend(self,"canBecomeMainWindow")){
return;
}
objj_msgSend(CPApp._mainWindow,"resignMainWindow");
CPApp._mainWindow=self;
objj_msgSend(self,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(self,_cmd){
with(self){
objj_msgSend(self,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,self);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,self);
}
}),new objj_method(sel_getUid("toolbar"),function(self,_cmd){
with(self){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(self,_cmd,_125){
with(self){
if(_toolbar===_125){
return;
}
objj_msgSend(objj_msgSend(_125,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_125;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_cmd,_128){
with(self){
var _129=objj_msgSend(self,"toolbar");
objj_msgSend(_129,"setVisible:",!objj_msgSend(_129,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_cmd){
with(self){
var _12c=CGRectMakeCopy(objj_msgSend(self,"frame")),_12d;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_12d=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_12d=CGRectMakeCopy(objj_msgSend(self,"frame"));
_12d.origin=_12c.origin;
}
objj_msgSend(self,"setFrame:",_12d);
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_cmd){
with(self){
var _130=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_131=CGRectMakeCopy(objj_msgSend(_attachedSheet,"frame"));
_131.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_130);
_131.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_131))/2);
objj_msgSend(_attachedSheet,"setFrameOrigin:",_131.origin);
}
}),new objj_method(sel_getUid("_animateAttachedSheet"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_136,_137,_138,_139){
with(self){
_attachedSheet=_136;
_136._isSheet=YES;
objj_msgSend(self,"_setAttachedSheetFrameOrigin");
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_136,self);
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_cmd){
with(self){
return _attachedSheet;
}
}),new objj_method(sel_getUid("isSheet"),function(self,_cmd){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_cmd,_144){
with(self){
if(!objj_msgSend(self,"performKeyEquivalent:",_144)){
objj_msgSend(self,"interpretKeyEvents:",[_144]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_cmd,_147){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_cmd,_14a){
with(self){
objj_msgSend(self,"selectNextKeyView:",nil);
}
}),new objj_method(sel_getUid("_dirtyKeyViewLoop"),function(self,_cmd){
with(self){
if(_autorecalculatesKeyViewLoop){
_keyViewLoopIsDirty=YES;
}
}
}),new objj_method(sel_getUid("_hasKeyViewLoop"),function(self,_cmd){
with(self){
var _14f=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_14f);
for(var i=0,_151=objj_msgSend(_14f,"count");i<_151;i++){
if(_14f[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_cmd){
with(self){
var _154=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_154);
var _155=objj_msgSend(_154,"sortedArrayUsingFunction:context:",_156,_contentView),_157=objj_msgSend(_155,"count");
for(var i=0;i<_157;i++){
objj_msgSend(_155[i],"setNextKeyView:",_155[(i+1)%_157]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_cmd,_15b,_15c){
with(self){
var _15d=objj_msgSend(_15b,"subviews"),_15e=objj_msgSend(_15d,"count");
while(_15e--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_15d[_15e],_15c);
}
objj_msgSend(_15c,"addObject:",_15b);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_cmd,_161){
with(self){
if(_autorecalculatesKeyViewLoop===_161){
return;
}
_autorecalculatesKeyViewLoop=_161;
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}else{
if(_autorecalculatesKeyViewLoop){
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_cmd){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_cmd,_166){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_cmd,_169){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_cmd,_16c){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_16c,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_cmd,_16f){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_16f,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_cmd,_172){
with(self){
objj_msgSend(self,"setDefaultButton:",_172);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_cmd){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_cmd,_177){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_177;
objj_msgSend(_defaultButton,"setDefaultButton:",YES);
}
}),new objj_method(sel_getUid("defaultButton"),function(self,_cmd){
with(self){
return _defaultButton;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"),function(self,_cmd){
with(self){
_defaultButtonEnabled=YES;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"),function(self,_cmd){
with(self){
objj_msgSend(self,"enableKeyEquivalentForDefaultButton");
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"),function(self,_cmd){
with(self){
_defaultButtonEnabled=NO;
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"),function(self,_cmd){
with(self){
objj_msgSend(self,"disableKeyEquivalentForDefaultButton");
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPWindow,"class")){
return;
}
var _184=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_184,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_cmd,_187){
with(self){
if(_187&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_187===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_cmd,_18a){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_18d,_18e){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_styleMask),"frameRectForContentRect:",_18d);
}
})]);
var _156=function(a,b,_191){
var _192=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_193=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_192)<CGRectGetMinY(_193)){
return -1;
}else{
if(CGRectGetMinY(_192)==CGRectGetMinY(_193)&&CGRectGetMinX(_192)<CGRectGetMinX(_193)){
return -1;
}else{
if(CGRectGetMinX(_192)==CGRectGetMinX(_193)&&CGRectGetMinX(_192)==CGRectGetMinX(_193)){
return 0;
}else{
return 1;
}
}
}
};
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_cmd){
with(self){
if(!objj_msgSend(_windowController,"document")||!objj_msgSend(self,"isMainWindow")){
return;
}
objj_msgSend(CPMenu,"setMenuBarTitle:",_title);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_cmd,_198){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _199=objj_msgSend(_platformWindow,"contentBounds"),_19a=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_199)-_198.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_199)-_198.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_19a.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_19a.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_19a.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_19a.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_19a);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_19f){
with(self){
_autoresizingMask=_19f;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_cmd,_1a4){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_1a4):objj_msgSend(self,"convertBaseToScreen:",_1a4);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_cmd,_1a7){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_1a7):objj_msgSend(self,"convertScreenToBase:",_1a7);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_cmd,_1aa){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1aa;
}
var _1ab=objj_msgSend(self,"frame").origin;
return {x:_1aa.x+_1ab.x,y:_1aa.y+_1ab.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_cmd,_1ae){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1ae;
}
var _1af=objj_msgSend(self,"frame").origin;
return {x:_1ae.x-_1af.x,y:_1ae.y-_1af.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_cmd,_1b2){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1b2));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_cmd,_1b5){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1b5));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_cmd,_1b8){
with(self){
if(_1b8&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1b8;
}
}),new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"),function(self,_cmd){
with(self){
return _sharesChromeWithPlatformWindow;
}
}),new objj_method(sel_getUid("undoManager"),function(self,_cmd){
with(self){
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_1bf){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_1c2){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_cmd,_1c5){
with(self){
return CGRectContainsPoint(_frame,_1c5);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_cmd,_1c8){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1c8);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_cmd){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_1cd){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1cd);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_1d0){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1d0);
}
})]);
var _1d1=function(_1d2,_1d3,_1d4){
return _1d2+(_1d3-_1d2)*_1d4;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_1d7,_1d8){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_1d7;
_targetFrame=CGRectMakeCopy(_1d8);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_1dd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_1dd);
var _1de=objj_msgSend(self,"currentValue");
if(_1de==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_1d1(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_1de),_1d1(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_1de)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_1d1(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_1de),_1d1(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_1de)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_1df,_1e0,_1e1,_1e2){
return {windowView:_1df,contentRect:_1e0,hasShadow:_1e1,level:_1e2};
};
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.j