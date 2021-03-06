/* Generated by RuntimeBrowser.
   Image: /System/Library/PrivateFrameworks/NearField.framework/NearField
 */

@class XPCConnection, NSString;

@interface NFCardEmulationNFCD : NFCardEmulation <XPCConnectionDelegate> {
    XPCConnection *_xpcConnectionCardEmulation;
    XPCConnection *_xpcConnectionFieldDetect;
}

@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;
@property(copy,readonly) NSString * description;
@property(copy,readonly) NSString * debugDescription;


- (id)_getXPCConnectionFD;
- (id)_getXPCConnectionCE;
- (void)_stopFieldDetect;
- (void)_startFieldDetect;
- (void)_stopCardEmulation;
- (void)_startCardEmulation;
- (void)XPCConnectionServiceDidRestart:(id)arg1;
- (void)XPCConnection:(id)arg1 didReceiveEvent:(id)arg2;
- (void)XPCConnectionDidTerminate:(id)arg1;
- (void)dealloc;

@end
