import 'dart:convert';
import 'dart:io';

void main() {
  final setupFile = File('setup.json');

  if (!setupFile.existsSync()) {
    print("❌ ملف setup.json غير موجود!");
    return;
  }

  final jsonData = jsonDecode(setupFile.readAsStringSync());

  // إنشاء المجلدات
  for (var folder in jsonData['folders']) {
    Directory(folder).createSync(recursive: true);
    print("📁 تم إنشاء المجلد: $folder");
  }

  // إنشاء الملفات
  (jsonData['files'] as Map).forEach((path, content) {
    File(path).writeAsStringSync(content);
    print("📄 تم إنشاء الملف: $path");
  });

  // تثبيت الباكجات
  if (jsonData['packages'].isNotEmpty) {
    final packages = jsonData['packages'].join(' ');
    print("📦 تثبيت الباكجات: $packages");
    Process.runSync('flutter', ['pub', 'add', ...jsonData['packages']]);
  }

  print("✅ تم إعداد المشروع بنجاح!");
}