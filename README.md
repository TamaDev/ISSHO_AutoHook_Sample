ISSHO_AutoHook_Sample
=====================

This code automatically hook UIControlEventTouch events.  
Only UIControl family of xib applies.  
As for you, import only ISSHOAutoHook.h including the following files for a project.  
ISSHOAutoHook.h  
ISSHOAutoHook.m  
TouchDownGestureRecognizer.h  
TouchDownGestureRecognizer.m  
MethodSwizzling.c  
MethodSwizzling.h  
When you want to cover all modules with a automatically hook, please import in .pch file.  

このコードはUIControlEventTouchを自動で横取りします。  
xibのUIControl系が対象となります。  
あなたはプロジェクトに以下のファイルを含めて、ISSHOAutoHook.hをimportするだけです。  
ISSHOAutoHook.h  
ISSHOAutoHook.m  
TouchDownGestureRecognizer.h  
TouchDownGestureRecognizer.m  
MethodSwizzling.c  
MethodSwizzling.h  
すべてのモジュールにフックをかけたい場合は.pchでimportしてください。  
