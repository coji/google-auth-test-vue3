[Vue 3 Google Login](https://github.com/devbaji/vue3-google-login)を使った SPA での Google ログインのデモアプリです。

まず GCP でプロジェクトつくって、OAuth 同意画面の設定した上で、OAuth クライアント ID 発行して、その設定を main.ts の初期化コードに入れる感じです。

具体的な設定方法はこの記事が参考になります。
https://qiita.com/cokemaniaIIDX/items/bdb9a00bef3c6c2365f5

1 点だけ、JavaScript 生成元の設定で、http://localhost と http://localhost:5173 の両方を設定する必要があるので注意です。

![承認済みのJavaScript生成元の設定](https://i.gyazo.com/4f6dc9aaab27adad27a4c60d3ac40a32.png)

ソースコードのポイントは [main.ts で初期化](https://github.com/coji/google-auth-test-vue3/blob/main/src/main.ts#L6) した上で、[App.vue でコンポーネントを使いつつ、callback でログイン処理として state にユーザ情報を入れる形です](https://github.com/coji/google-auth-test-vue3/blob/main/src/App.vue#L35)

[ここでやっているように、callback の credential を API サーバに投げて](https://github.com/coji/google-auth-test-vue3/blob/main/src/App.vue#L7)、[サーバ側で検証](https://github.com/coji/google-auth-test-vue3/blob/main/src/api/auth.rb)し、その検証結果自体を使ってセッション情報をローカルストレージに入れるのが基本になるかな〜とおもいます。
