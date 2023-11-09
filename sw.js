// Cache infos
const VERSION_APP = "V2.2"
const STATIC_CACHE_URLS = ["./","./index.html","./admin.html","img/back4.jpg","img/chargement.gif","./user_home.html","src/jquery.min.js","src/scripts.js","style/bootstrap/dist/css/bootstrap.css","style/bootstrap/dist/css/bootstrap.min.css","style/fontweb/css/fontawesome.css","style/fontweb/css/all.min.css","style/fontweb/css/fontawesome.min.css"];

// PWA Installation
self.addEventListener("install", event => {
    console.log("Service Worker installing version : " + VERSION_APP);
    self.skipWaiting();
    event.waitUntil(
        caches.open(VERSION_APP).then(cache => cache.addAll(STATIC_CACHE_URLS))
    );
});

self.addEventListener("activate", event => {
    console.log("Service Worker Activation version :" + VERSION_APP);
    clients.claim();
    // delete any unexpected caches
    event.waitUntil(
        caches
            .keys()
            .then(keys => keys.filter(key => key !== VERSION_APP))
            .then(keys =>
                Promise.all(
                    keys.map(key => {
                        console.log(`Deleting cache ${key}`);
                        return caches.delete(key);
                    })
                )
            )
    );
})

self.addEventListener("fetch", event => {
    event.respondWith(
        caches.match(event.request).then(response => {
            return response || fetch(event.request);
        })
    );
});
