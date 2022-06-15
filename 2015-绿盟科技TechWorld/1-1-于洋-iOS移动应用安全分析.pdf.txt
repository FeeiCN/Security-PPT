IOS
wnswfocwu.sn.csofmocus.com

© 2015 

1  2 APP 3  4 


APP Downloads 100 Billion In 2015 the App Store has
1,500,000 apps

Android

iOS



18% 82%

Android: 2008-03-06 2014-07-01

iOS: 2007-08-02 2014-11-13

1  2 APP 3  4 

APP

APP

· APP ·  ·  · APP ·  · Tweakhook OCdylib · ..........

APP


APP


 - API
 

 - API
 

APP


 - APP

 - APP

 - APP

 - APP

 - APP

 - APP

APP


APP


iOS8 APP
·dumpdecrypted
xcrun --sdk iphoneos --show-sdk-path
MakefileGCC_UNIVERSAL

APP

APP
iOS8 APP
· makedumpdecrypted.dylib https://github.com/mryu-org/dumpdecrypted-8/blob/master/dumpdecrypted.dylib eg
iOSSSH
iOS7 APP/var/mobile/Applications/xxxxxx-xxxxx-xxxxx-xxxxx-xxxxx/xxxxxxx.app/xxx iOS8 APP/var/mobile/Containers/Bundle/Application/xxxxx-xxxxx-xxxxx-xxxxx-xxxxx/X

APP
iOS8 APP
OLD:dumpdecrypted.dylibBundleApplication
dumpdecrypted.dylib/var/mobile/Containers/Data/Application/xxxxx-xxxxx-xxxxx-x
XXXXX.appBundle

APP
iOS8 APP
· Documents
root# cycript -p TargetApp cy# [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUse #"file:///var/mobile/Containers/Data/Application/D41C4343-63AA-4BFF-904B-2146128611EE/Doc
· 
DYLD_INSERT_LIBRARIES=dumpdecrypted8.dylib /var/mobile/Containers/Bundle/Application/6A482

APP
Tweak

APP

·  ·  · Sand Box · iOS8  · .........

APP


APP


APP


Sand Box

·  ·  · spawn · Bootstrap
iOS8 

SandBox

iOS8 
NSFileManager
· /Applications/Cydia.app · /Library/MobileSubstrate/MobileSubstrate.dylib · /bin/bash · /usr/sbin/sshd · /etc/apt


APP

APP

APP

1  2 APP 3  4 

 - APP



 - APP



 - APP



 - APP



 - APP



 - APP



 - APP


APPTweak

 - APPTweak

 - APPTweak
{ "attachment": { "status": 0, "msg": "ok", "jifen": 0, "dengji": 0, "uid": xxxxxxxxx, "passport": "yyyyyyyyyy@sina.sohu.com", "nickname": "TracyYih", "smallimg": "http://tp3.sinaimg.cn/1342106870/50/5664617611/1", "mobile": "", "email": "", "birthday": "", "gender": 1, "utype": 31, "token": "1ee4863ec29030730e624afdb401a3e6", "isVip": "0", "vipexpire": "" }, "message": "", "debug": null, "status": 200
}

 - APPTweak
@interface UserDataModel : NSObject {
BOOL isVip;NSString *passport;NSString *password; NSString *nickname;NSString *profileImage; NSString *mobile;NSString *email;NSString *birthday; NSString *requestToken;NSString *vipExpire;NSString *score; NSString *grade;NSString *uid;int gender;int loginTpye; } @property int loginTpye; // @synthesize loginTpye; @property int gender; // @synthesize gender; @property(copy, nonatomic) NSString *uid; // @synthesize uid; @property(copy) NSString *grade; // @synthesize grade; @property(copy) NSString *score; // @synthesize score; @property(copy) NSString *vipExpire; // @synthesize vipExpire; @property BOOL isVip; // @synthesize isVip; @property(copy) NSString *requestToken; // @synthesize requestToken; @property(copy) NSString *birthday; // @synthesize birthday; @property(copy) NSString *email; // @synthesize email; @property(copy) NSString *mobile; // @synthesize mobile; @property(copy) NSString *profileImage; // @synthesize profileImage; @property(copy) NSString *nickname; // @synthesize nickname; //...@end

%hook UserDataModel
- (BOOL)isVip {
return YES; }
%end

 - APPTweak

 - APPTweak

- (BOOL)getModelIsVip {
if (self.dataModel.isVip) {
} retrun NO; }

 - APPTweak

 - APPTweak
- (BOOL)getModelIsVip {
if (self.dataModel.isVip) { NSString *vipExpire = self.dataModel.vipExpire; if (vipExpire && vipExpire.length) {
} } retrun NO; }

 - APPTweak

 - APPTweak
- (BOOL)getModelIsVip {
if (self.dataModel.isVip) { NSString *vipExpire = self.dataModel.vipExpire; if (vipExpire && vipExpire.length) { if (!self.dateFormatter) { self.dateFormatter = [[[NSDateFormatter alloc] init] autorelease]; [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]; [self.dateFormatter setLocale:locale]; } }
} retrun NO; }

 - APPTweak

 - APPTweak
#define kYearInterval 31536000.0
%hook UserDataModel
- (BOOL)isVip {
return YES; }
- (NSString *)vipExpire {
NSDate *date = [[NSDate date] dateByAddingTimeInterval:kYearInterval]; NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease]; [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; return [dateFormatter stringFromDate:date]; }
%end

1  2 APP 3  4 



 






