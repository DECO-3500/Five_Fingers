<template>
    <div id="map" style="width: 100%; height: 70vh;"></div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();
/* global google */

onMounted(() => {
    // 初始化并添加地图
    initMap();
});

// 初始化地图
function initMap() {
    // 地图的中心坐标（示例为北京）
    const center = ref({ lat: 39.915, lng: 116.404 });

    const lat = parseFloat(route.query.lat);
    const lng = parseFloat(route.query.lng);

    if (!isNaN(lat) && !isNaN(lng)) {
        center.value = { lat, lng }; // 正确更新响应式对象
        console.log(center.value); // 访问 center 的值
    }
    
    // 创建地图，指定中心和缩放级别
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 19,
        center: center.value, // 确保使用 center.value
    });

    // 定义图钉位置
    const locations = [
        { lat: -33.8568, lng: 151.2153, title: "Sydney Opera House", content: "Welcome to Sydney！" },
        { lat: -33.8711, lng: 151.1981, title: "Daling Harbour", content: "A vibrant waterfront destination featuring shopping, dining, and entertainment venues, along with stunning harbor views." },
        { lat: -33.8523, lng: 151.2108, title: "Sydney Harbour Bridge", content: "An iconic arch bridge connecting the Sydney CBD and North Shore, famous for its scenic views and thrilling bridge climb." },
        { lat: -33.7139, lng: 150.3119, title: "Blue Mountains", content: "A breathtaking natural region west of Sydney, known for its dramatic cliffs, eucalyptus forests, and the iconic Three Sisters rock formation." },
        { lat: -33.8642, lng: 151.2166, title: "Royal Botanic Garden Sydney", content: "A lush, historical garden by the harbor offering beautiful landscapes, walking paths, and stunning views of the Sydney Opera House" },
        { lat: -33.8587, lng: 151.2102, title: "Quay Restaurant", content: "An award-winning fine dining restaurant with sweeping views of Sydney Harbour, offering a modern Australian menu crafted by top chefs." },
        { lat: -33.8705, lng: 151.2088, title: "Sydney Tower", content: "The tallest structure in Sydney, offering 360-degree panoramic views of the city skyline, harbour, and beyond from its observation deck and revolving restaurant." },
        { lat: -33.8436, lng: 151.2413, title: "Taronga Zoo Sydney", content: "A world-class zoo with a focus on conservation, home to a wide variety of animals and offering spectacular views of Sydney Harbour." },
        { lat: -33.8908, lng: 151.2743, title: "Bondi Beach", content: "One of Australia's most famous beaches, known for its golden sand, surfing culture, and lively atmosphere." },
        { lat: -33.8572, lng: 151.2152, title: "Bennelong Restaurant", content: "A fine dining restaurant located within the Sydney Opera House, offering contemporary Australian cuisine with iconic views of the harbor." },
        { lat: -27.4748, lng: 153.0181, title: "South Bank Parklands", content: "A popular riverside park with a man-made beach, scenic walkways, and cultural attractions in the heart of Brisbane." },
        { lat: -27.4612, lng: 153.0348, title: "Story Bridge", content: "An iconic steel bridge offering breathtaking views of Brisbane, with the option to participate in a thrilling bridge climb." },
        { lat: -27.4754, lng: 152.9730, title: "Brisbane Botanic Gardens - Mount Coot-tha", content: "A peaceful botanic garden showcasing tropical plants, with a lookout on Mount Coot-tha offering panoramic city views." },
        { lat: -27.4710, lng: 153.0186, title: "Queensland Art Gallery", content: "A premier art gallery displaying both Australian and international works, located in Brisbane's cultural precinct." },
        { lat: -27.4621, lng: 153.0174, title: "Roma Street Parkland", content: "A lush urban park featuring stunning gardens, walking paths, and picnic spots, perfect for relaxation in the city." },
        { lat: -27.4770, lng: 153.0197, title: "The Wheel of Brisbane", content: "A giant observation wheel that offers panoramic views of Brisbane and its surroundings from South Bank." },
        { lat: -27.4685, lng: 153.0234, title: "Brisbane City Hall", content: "A historic building and cultural landmark that houses the Museum of Brisbane and offers a clock tower tour with views of the city." },
        { lat: -27.4691, lng: 153.0275, title: "Esquire", content: "A modern fine dining restaurant known for its innovative, seasonal dishes using locally sourced ingredients." },
        { lat: -27.4720, lng: 153.0290, title: "Alchemy", content: "A contemporary riverside restaurant serving European-inspired cuisine with stunning views of the Brisbane River." },
        { lat: -27.4605, lng: 153.0344, title: "Gerard's Bistro", content: "A trendy restaurant in Fortitude Valley offering a creative Middle Eastern-inspired menu in a stylish, modern setting." },
        { lat: -27.4655, lng: 153.0330, title: "E'cco Bistro", content: "A renowned Brisbane restaurant serving modern Australian cuisine, known for its sophisticated dishes and relaxed atmosphere." }
    ];

    // 添加图钉和信息窗口
    locations.forEach(location => {
        const marker = new google.maps.Marker({
            position: { lat: location.lat, lng: location.lng },
            map: map,
            title: location.title,
        });

        const infoWindow = new google.maps.InfoWindow({
            content: `<h4>${location.title}</h4><p>${location.content}</p>`,
        });

        marker.addListener("click", () => {
            infoWindow.open(map, marker);
        });
    });
}
</script>

<style scoped>
#map {
    width: 100%;
    height: 70vh; /* 高度占满 70% */
}
</style>