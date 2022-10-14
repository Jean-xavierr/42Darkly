# Reflected XSS

En cliquant sur la troisième image (NSA) sur la page d'index on arrive sur la page:

`http://192.168.56.101/?page=media&src=nsa`

On y découvre une image affichée grâce à une balise `<object>`

Après lecture de cet article: https://portswigger.net/web-security/cross-site-scripting#reflected-cross-site-scripting

> Reflected XSS is the simplest variety of cross-site scripting. It arises when an application receives data in an HTTP request and includes that data within the immediate response in an unsafe way.
> Here is a simple example of a reflected XSS vulnerability:
> ```
> https://insecure-website.com/status?message=All+is+well.
> <p>Status: All is well.</p>
> ```

On va donc essayer d'injecter le payload suivant:
`<script>alert(1)</script>`

Comme on veut l'injecter dans la propriété `data` de `object`, on va devoir le convertir en `base64`:
`PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`

(Converti par https://www.base64decode.org)

Ce qui nous donne l'url suivante pour attaquer:

http://192.168.56.101/index.php?page=media&src=%22data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==%22

On obtient le flag:
```
928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d
```

# Why it's dangerous

L'attaquant peut éxécuter le code qu'il souhaite sur le serveur de production. Avoir accès à des fichiers confidentiels. Faire tourner un logiciel malveillant etc ...

# How to fix it

Utiliser une balise HTML `img` qui prend en paramètre l'URL de l'image en question. Avoir un CDN, stocker les images dans le front ou vérifier l'input dans le backend.
