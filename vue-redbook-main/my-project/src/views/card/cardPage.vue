<template>
	<div style="display: flex">
		<div style="margin-top: 40px;" @click="plus">			
			<svg t="1728622425894" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5111" width="200" height="200"><path d="M269.9 513.5c0-4.3 1.1-8.5 3.3-12.4l219.7-385.7c6.8-12 22.1-16.2 34.1-9.3 12 6.8 16.2 22.1 9.3 34.1L323.7 513.4 536.3 883c6.9 12 2.8 27.3-9.2 34.1s-27.3 2.8-34.1-9.2l-219.7-382c-2.3-3.8-3.4-8.1-3.4-12.4z" fill="#e6e6e6" p-id="5112"></path><path d="M484.5 513.5c0-4.3 1.1-8.5 3.3-12.4l219.7-385.7c6.8-12 22.1-16.2 34.1-9.3 12 6.8 16.2 22.1 9.3 34.1L538.3 513.4 750.9 883c6.9 12 2.8 27.3-9.2 34.1-12 6.9-27.3 2.8-34.1-9.2l-219.7-382c-2.3-3.8-3.4-8.1-3.4-12.4z" fill="#e6e6e6" p-id="5113"></path></svg>
		</div>
		<div class="card" style="margin-left: 15%;">
			<div class="imgBox">
				<img v-if="place_list" :src="`http://localhost:3000/api/places/${place_list.title_image}`" alt="User Image" />
				<img v-if="place_list" :src="`http://localhost:3000/api/places/${place_list.second_title}`" alt="User Image" />
			</div>			
			<div class="details">
				<div class="content">
					<h2>{{ place_list?.place_name }} <br></h2>
					<p>{{ place_list?.description }}</p>
					<strong>-----{{ place_list?.location }}</strong>
					<div style="display: flex;">
						<router-link 
						v-if="place_list" 
						:to="`map?lat=${place_list.lat}&lng=${place_list.lng}`">
							<div><svg t="1728625722521" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8395" width="40" height="40"><path d="M728.847059 216.847059l-481.882353 391.529412 240.941176 30.117647 144.564706 192.752941 96.376471-614.4z" fill="#52A3CC" p-id="8396"></path></svg></div>
						</router-link>
						<router-link to="/partnerPage">						
							<div style="margin-left: 20px;"><svg t="1728625590652" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7401" width="40" height="40"><path d="M751.514864 525.577481a213.270123 213.270123 0 0 0 76.610371-163.877925c0-117.342815-96.00316-213.333333-213.333334-213.333334-117.342815 0-213.333333 95.990519-213.333333 213.333334 0 65.940543 30.049975 124.118914 76.61037 163.877925-127.03921 53.336494-216.25363 179.38963-216.253629 325.82163a38.899358 38.899358 0 0 0 38.78558 38.78558 38.899358 38.899358 0 0 0 38.798222-38.78558c0-152.247309 124.118914-275.39279 275.39279-275.39279 152.234667 0 275.39279 123.145481 275.39279 275.39279a38.899358 38.899358 0 0 0 38.785581 38.78558 38.899358 38.899358 0 0 0 38.78558-38.78558c0-146.432-89.21442-272.485136-216.240988-325.82163zM479.029728 362.672988c0-74.676148 61.086025-135.774815 135.762173-135.774815 74.663506 0 135.749531 61.098667 135.749531 135.774815 0 74.663506-61.086025 135.749531-135.749531 135.749531-74.676148 0-135.762173-61.086025-135.762173-135.762173z" fill="#da6050" p-id="7402"></path><path d="M326.795062 551.759012c2.907654 0 4.841877 0 6.776098-0.973432h0.973433c18.419358-2.907654 31.99684-19.39279 31.996839-37.812148a38.899358 38.899358 0 0 0-38.78558-38.798222 81.389037 81.389037 0 0 1-58.178371-24.234667 83.07042 83.07042 0 0 1-24.247308-58.17837c0-45.574321 36.851358-83.399111 83.399111-83.399111a38.899358 38.899358 0 0 0 38.78558-38.785581 38.899358 38.899358 0 0 0-38.78558-38.78558c-88.240988 0-159.99684 71.755852-159.99684 160.970272 0 41.693235 15.511704 80.478815 43.627457 109.568C125.092346 543.99684 64.979753 632.237827 64.979753 735.029728a38.899358 38.899358 0 0 0 38.78558 38.785581 38.899358 38.899358 0 0 0 38.785581-38.785581c0-100.845037 82.425679-183.270716 184.244148-183.270716z" fill="#da6050" p-id="7403"></path></svg></div>
						</router-link>
					</div>
				</div>
				
				
			</div>
		
		</div>

		<div style="margin-left: 15%;margin-top: 40px;" @click="minus" >
			<svg t="1728622204522" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3389" width="200" height="200"><path d="M836.4 508.9c0 6.6-2.6 13-7.3 17.7L443.6 912.2c-9.8 9.8-25.6 9.8-35.4 0-9.8-9.8-9.8-25.6 0-35.4L776 509 408.3 144.7c-9.8-9.7-9.9-25.5-0.2-35.4 9.7-9.8 25.5-9.9 35.4-0.2l385.5 382c4.7 4.7 7.4 11.1 7.4 17.8 0-0.1 0 0 0 0z" fill="#e6e6e6" p-id="3390"></path><path d="M621.8 508.9c0 6.6-2.6 13-7.3 17.7L229 912.2c-9.8 9.8-25.6 9.8-35.4 0-9.8-9.8-9.8-25.6 0-35.4L561.3 509 193.7 144.7c-9.8-9.7-9.9-25.5-0.2-35.4 9.7-9.8 25.5-9.9 35.4-0.2l385.5 382c4.7 4.7 7.3 11.1 7.4 17.8 0-0.1 0 0 0 0z" fill="#e6e6e6" p-id="3391"></path></svg>
		</div>
		
	</div>
    
</template>


<script setup>

import { ref,onMounted } from 'vue';

import axios from 'axios';

const places = ref([]); // 假设你从 API 获取用户数据并赋值给这个变量
const place_list=ref(null);
const index=ref(0);
const fetchUsers = async () => {
  try {
	const response = await axios.get('http://localhost:8080/api/api/getPlaces');
	places.value = response.data;
	place_list.value=response.data[index.value];
	console.log(place_list.value)
  } catch (error) {
	console.error('Error fetching users:', error);
  }
};

const plus = () => {
    // 确保 index 在有效范围内
    if (index.value < places.value.length - 1) {
        index.value += 1;
    } else {
        // 如果已经是最后一个，循环回到第一个
        index.value = 0;
    }
    place_list.value = places.value[index.value];
    console.log(place_list.value);
}

const minus = () => {
    // 确保 index 在有效范围内
    if (index.value > 0) {
        index.value -= 1;
    } else {
        // 如果已经是第一个，循环到最后一个
        index.value = places.value.length - 1;
    }
    place_list.value = places.value[index.value];
    console.log(place_list.value);
}


onMounted(fetchUsers);

</script>




<style scoped>
@import '../../assets/css/card_style.css';
</style>