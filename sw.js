// Cache infos
const VERSION_APP = "V2.1"
const STATIC_CACHE_URLS = ["./offline.html"];

// PWA Installation
self.addEventListener("install", event => {
    console.log("Service Worker installing version : " + VERSION_APP);
    self.skipWaiting();
    event.waitUntil(
        caches.open(VERSION_APP).then(cache => cache.addAll(STATIC_CACHE_URLS))
    );
});
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3Y4HizXHhd8LQ+vqufUNZ6AuSWtlOw481WKSmpfxiY2UsY24elLF6GGY31HX9NnZ3tlugoXPL9SaGpwTEw6zJbmEHHWwtq8NWT2lmpAnrflieUOlWlN43x5Dwcq/jl9WnhaORXPHUkNdHOkjYvT94ZjmT+pesVWAwkV40pfLJJh1igTxP8QmktlHbave5PpJLu0khJ9NyIr98xCUj7AHaeY3X1zlGVlKW+dE3ud2kD1ZrOOhdRGaVRSS9vKP8OsN4eWq5AL7pqSLRc48DYEdTPxonLSTBcr8hNNggaF8KqRBzNhzwpAdum6Eubdzz5nt2H2GMgpkww8ez1G6acu7UsbapP7Fw/+8Dh3XWURKZtYR+ciHPIuRfQkIalkrBAEVPF1n43+l4kFQ/Hh3ey13dt/ZcwR2HwCWHinHBGFqs6vSZ29XMSkc8Zdf+kQ8/keKs0twxgD+0MNdL4aGhWbR2fU229E+CAYEuXkjPrugimeihyKOjykroy/yOyBtNoYM= u898308728@fr-int-web991.main-hosting.eu
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
    // console.log(`Request : ${event.request.url} & ${event.request.mode}`);
    if (event.request.mode == "navigate") {

        event.respondWith(
            (async () => {
                try {
                    const preloadResponse = await event.preloadResponse
                    if (preloadResponse) {
                        return preloadResponse
                    }
                    return await fetch(event.request)
                } catch (error) {
                    const cache = await caches.open(VERSION_APP)
                    return await cache.match("/offline.html")
                }
            })()
        )
    }

});

self.addEventListener('push', event => {
    console.log(event);
    // console.log(JSON.parse(event.data.text()));
    // payload
    // {"title":"Title","body":"body testing push notif","url":"/" }
    const data = JSON.parse(event.data.text())
    const options = {
        body: data.body,
        icon: 'src/img/icon512x512.png',
        image: data.image,
        data: {
            notifURL: data.url
        }
    };
    event.waitUntil(self.registration.showNotification(data.title, options));
});
self.addEventListener('notificationclick', event => {
    event.notification.close();
    event.waitUntil(
        clients.openWindow(event.notification.data.notifURL)
    );
});