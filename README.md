# Test Locale

> [!WARNING]
> **HERE BE DRAGONS**
>
> This is a playground for messing about with localization under Linux, especially for `DefaultFormatSettings`.

The goal of this little project is to attempt to change the language of any application on the fly.

In terms of a `GUI` application that has the appropriate `.po` files on either folders `locale` or `languages` on the same path where the executable is, it's quite simple...

**First**, under `Project Options->i18n` you enable it and choose a folder. It's advised you choose `loacale` or `languages` since that's where the app will try to find the `.po` files.

**Second**, on the form, or forms, you want to have translated you need to add this unit at the top:
```pas
uses
  ..., DefaultTranslator;
```
This will automatically pick up your system's language and translate the application. Depending you have the correct `.po` file, of course.

**Third**, and this is optional, if you want to switch from one language to another at runtime:
```pas
uses
  ..., LCLTranslator, DefaultTranslator;


procedure Form1.ButtonFrenchChange(Sender: TObject);
begin
  SetDefaultLang('fr');
end;
```

This is all good and dandy, but it does not change the `DefaultFormatSettings` values.
My goal is to change that.

> [!IMPORTANT]
>
> You have to have the language settings installed on your system. Don't need to change to it, just have it around.
> If you haven't downloaded and installed a second language on your system, the part that deals with `DefaultFormatSettings` will do nothing.

Having said that, you can look at the unit [myclocale](src/myclocale.pas) in order to see what happens.
The application named [test-locale-gui](https://github.com/gcarreno/TestLocale/blob/main/src-gui/forms/forms.main.pas#L82) has the code to trigger both the language and the format settings change.