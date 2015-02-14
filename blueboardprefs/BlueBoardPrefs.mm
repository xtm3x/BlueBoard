#import <Preferences/Preferences.h>

@interface BlueBoardPrefsListController: PSListController {
}
@end

@implementation BlueBoardPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BlueBoardPrefs" target:self] retain];
	}
	return _specifiers;
}
- (void)twitter {

    NSString * _user = @"xTM3x";

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:_user]]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:_user]]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:_user]]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:_user]]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:_user]]];
    }
}
-(void)web {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://blog.data-cache.appspot.com"]];
}
- (void)respring {
    system("cd /var/mobile/Library/Caches; rm -R com.apple.keyboards");
    system("killall -9 SpringBoard");
}
@end

// vim:ft=objc
