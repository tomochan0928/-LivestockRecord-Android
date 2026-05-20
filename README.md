# 🐄 家畜診療記録 Android アプリ

WebView ベースの Android アプリ。HTML+JavaScript で動作し、完全オフラインで動作します。

## 機能

- **診療記録入力**: 日付・時間・部屋番号・耳標番号・症状・使用薬品・使用量・備考
- **バーコードスキャン**: Android BarcodeDetector API によるカメラスキャン
- **オフライン動作**: ネットワーク不要（全データをローカルストレージに保存）
- **CSV エクスポート**: Excel 対応（BOM付きUTF-8）
- **JSON バックアップ/リストア**

## ビルド方法

### ローカルビルド

```bash
# デバッグ APK
./gradlew assembleDebug

# リリース APK（署名設定が必要）
./gradlew assembleRelease
```

### GitHub Actions 自動ビルド

タグをプッシュすると自動でビルド＆リリースが行われます。

```bash
git tag v1.0.0
git push origin v1.0.0
```

## GitHub Actions シークレット設定（リリース署名用）

リポジトリの Settings → Secrets → Actions に以下を設定：

| シークレット名      | 内容                                          |
|---------------------|-----------------------------------------------|
| `KEYSTORE_BASE64`   | keystore ファイルの Base64 エンコード          |
| `KEYSTORE_PASSWORD` | keystore パスワード                           |
| `KEY_ALIAS`         | キーエイリアス                                |
| `KEY_PASSWORD`      | キーパスワード                                |

シークレット未設定の場合は **デバッグ APK** のみビルドされます。

### keystore の作成

```bash
keytool -genkey -v -keystore livestock-release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias livestock

# Base64 エンコード
base64 -i livestock-release.jks
```

## ディレクトリ構成

```
LivestockRecord-Android/
├── .github/workflows/build-release.yml   # CI/CD
├── app/
│   ├── src/main/
│   │   ├── assets/index.html             # メインHTMLアプリ
│   │   ├── java/com/livestock/record/
│   │   │   └── MainActivity.java         # WebViewラッパー
│   │   ├── res/
│   │   │   ├── layout/activity_main.xml
│   │   │   ├── values/strings.xml
│   │   │   └── mipmap-*/ic_launcher.png
│   │   └── AndroidManifest.xml
│   ├── build.gradle
│   └── proguard-rules.pro
├── build.gradle
├── settings.gradle
└── gradle/wrapper/
```

## 動作要件

- Android 7.0 (API 24) 以上
- カメラ権限（バーコードスキャン用）
- Chrome/WebView 84以上（BarcodeDetector API対応）
