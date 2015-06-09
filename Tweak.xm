//Define prefs
static NSDictionary *dict;

static BOOL enabled;
static BOOL isDark;

%group Memes
//Blue keys
%hook UIKBRenderFactory
-(BOOL) useBlueThemingForKey:(id)arg1 {
	return YES;
}
%end

//Black Keyboard
%hook UITextInputTraits
-(int) keyboardAppearance {
	if (isDark) return YES;
	return %orig;
}
%end
%end

%ctor {
	dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.xtm3x.blueboard~prefs.plist"];
	enabled = [[dict objectForKey:@"enabled"] boolValue];
	isDark = [[dict objectForKey:@"isDark"] boolValue];
	
	if (enabled) %init(Memes);
}
