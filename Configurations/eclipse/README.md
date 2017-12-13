# Eclipse

## Works with HiDPI

Edit the ***eclipse.ini*** file. In my system, it's in ***/usr/lib/eclipse*** folder. Add this content:

- **At the end of this file**: -Dswt.autoScale=exact 
- **Before these lines,**  
--launcher.appendVmargs  
-vmargs  
**add the following content**:  
--launcher.GTK_version  
2

That force eclipse to use the version 2 of GTK because I've a bad rendering with the version 3.


