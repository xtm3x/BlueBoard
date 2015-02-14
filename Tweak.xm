//Define prefs
NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.xtm3x.blueboard~prefs.plist"];

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
