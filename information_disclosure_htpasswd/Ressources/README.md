# Information Disclosure Htpasswd

https://portswigger.net/web-security/information-disclosure/exploiting

> Many websites provide files at /robots.txt and /sitemap.xml to help crawlers navigate their site. Among other things, these files often list specific directories that the crawlers should skip, for example, because they may contain sensitive information.

On peut lire le fichier `/robots.txt`. Contenant:
```
Disallow: /whatever
Disallow: /.hidden
```

On peut lire le fichier `/whatever/htpasswd`, contenant:
```
root:437394baff5aa33daa618be47b75cb49
```

On tente de le décrypter depuis md5 grâce à ce site: \
https://md5decrypt.net/

Cela nous donne: `qwerty123@`

On peut se log sur la page admin: http://192.168.56.101/admin/

> The flag is : d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff

# Why it's dangerous

Tout le monde peut lire ces données car accessible sans système d'authenfication.

Et donc tout le monde peut se connecter en tant qu'admin.

# How to fix it

Ne pas exposer des données sensibles à tous les utilisateurs, des fichiers de conf (clé SSH, clé API...)

Pour des données sensibles, avoir un backend avec un système d'authenfication

Faire attention aux fichiers accessibles !
