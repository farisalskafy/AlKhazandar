@echo off
chcp 65001 >nul
 title إنشاء تطبيق الخزندار
 echo ======================================
 echo       إنشاء تطبيق الخزندار للمبيعات
 echo ======================================
 echo.
 where node >nul 2>nul
 if errorlevel 1 (
   echo لم يتم العثور على Node.js.
   echo ثبّت Node.js إصدار LTS من الموقع الرسمي ثم أعد تشغيل هذا الملف.
   pause
   exit /b 1
 )
 echo جاري تنزيل مكونات التطبيق - يلزم الإنترنت لهذه الخطوة الأولى...
 call npm install
 if errorlevel 1 goto error
 echo.
 echo جاري إنشاء ملف التثبيت لنظام Windows...
 call npm run dist
 if errorlevel 1 goto error
 echo.
 echo اكتمل! ستجد ملف التثبيت داخل مجلد dist.
 pause
 exit /b 0
:error
 echo حدث خطأ أثناء التجهيز. تأكد من اتصال الإنترنت ثم حاول مجدداً.
 pause
 exit /b 1
