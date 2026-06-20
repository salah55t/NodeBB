# استخدام نسخة Node.js الرسمية
FROM node:18-slim

# إنشاء مجلد العمل
WORKDIR /usr/src/app

# تثبيت الأدوات الأساسية والـ wget لفك الضغط
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

# تحميل أحدث نسخة مستقرة مباشرة كملف مضغوط لضمان الفك الصافي
RUN wget https://github.com/NodeBB/NodeBB/archive/refs/heads/v3.x.tar.gz \
    && tar -xzf v3.x.tar.gz --strip-components=1 \
    && rm v3.x.tar.gz

# التأكد من أننا في المسار الصحيح حيث تم فك الملفات
WORKDIR /usr/src/app

# تثبيت الحزم والاعتماديات
RUN npm install --omit=dev

# فتح المنفذ
EXPOSE 4567

# أمر التشغيل
CMD ["node", "app.js"]
