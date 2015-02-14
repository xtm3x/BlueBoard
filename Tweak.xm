//Define prefs
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.xtm3x.blueboard~prefs.plist"];
static UIImageView *imgView =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,20,20)];

//Blue keys
%hook UIKBRenderFactory
-(BOOL) useBlueThemingForKey:(id)arg1 {
	if ([[dict objectForKey:@"enabled"] boolValue])
	{
		return true;
	}
	else
	{
		return %orig;
	}
}
%end

//Black Keyboard

%hook UITextInputTraits
-(int) keyboardAppearance {
	if ([[dict objectForKey:@"enabled"] boolValue])
	{
		if ([[dict objectForKey:@"isDark"] boolValue])
		{
			return 1;
		}
		else
		{
			return %orig;
		}
	}
	else
	{
		return %orig;
	}
	
}
%end
