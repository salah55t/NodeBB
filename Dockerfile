# استخدام نسخة Node.js الرسمية والمستقرة
FROM node:18-slim

# إنشاء مجلد العمل داخل الحاوية
WORKDIR /usr/src/app

# تثبيت الأدوات الأساسية لنظام لينكس لبناء إضافات المنتدى
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# نسخ كافة ملفات المنتدى الموجودة في مستودعك مباشرة إلى الحاوية
COPY . .

# تثبيت الحزم والاعتماديات الصافية للمنتدى
RUN npm install --omit=dev

# فتح المنفذ الافتراضي للمنتدى
EXPOSE 4567

# أمر التشغيل
CMD ["node", "app.js"]
