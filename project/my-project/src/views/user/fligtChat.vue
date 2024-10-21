<template>
  <div>
    <div>
      <label for="flight-search">Search Flight Number:</label>
      <input
        type="text"
        id="flight-search"
        v-model="searchQuery"
        @input="filterFlights"
        placeholder="Emter the flight number, e.g.: AA123"
        style="font-size: 16px; padding: 10px; width: 300px; margin-right: 10px;"
      />
      <label for="date-search">Choose Date:</label>
      <input
        type="date"
        id="date-search"
        v-model="selectedDate"
        style="font-size: 16px; padding: 10px; margin-right: 10px;"
      />
      <button 
        @click="showSearchResult" 
        style="font-size: 16px; padding: 10px 20px;"
      >
        Search
      </button>
    </div>

    <div v-if="searchResult" class="search-result">
      Currently Searching Flight Numbers: {{ searchResult }} Date: {{ selectedDate }}
    </div>

    <div class="grid-container">
      <div v-for="(flight, index) in filteredFlights" :key="index" class="grid-item">
        <img :src="flight.image" :alt="`${flight.flightNumber} 的图片`" />
        <div class="flight-info">
          <h3>{{ flight.flightNumber }}</h3>
          <p>Destination: {{ flight.destination }}</p>
          <p>Date: {{ flight.date }}</p>
          <p>Airline company: {{ flight.airline }}</p>
          <router-link :to="`/groupChat?flightNumber=${flight.flightNumber}&flightDate=${flight.date}`">
            <button>Access to Chat Group</button>
          </router-link>
        </div>
      </div>
    </div>

    <div v-if="filteredFlights.length === 0" class="no-results">
      No flights matching "{{ searchQuery }}" and "{{ selectedDate }}" were found
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

// 模拟航班数据
const flights = ref([
  {
    "flightNumber": "AA123",
    "destination": "Brisbane",
    "date": "2024-10-14",
    "airline": "Brisbane Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005821.png"
  },
  {
    "flightNumber": "BB456",
    "destination": "Sydney",
    "date": "2024-10-14",
    "airline": "Sydney Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005832.png"
  },
  {
    "flightNumber": "CC789",
    "destination": "Melbourne",
    "date": "2024-10-15",
    "airline": "Melbourne Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005841.png"
  },
  {
    "flightNumber": "DD321",
    "destination": "Canberra",
    "date": "2024-10-15",
    "airline": "Canberra Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005849.png"
  },
  {
    "flightNumber": "EE654",
    "destination": "Perth",
    "date": "2024-10-16",
    "airline": "Perth Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005855.png"
  },
  {
    "flightNumber": "FF987",
    "destination": "Adelaide",
    "date": "2024-10-16",
    "airline": "Adelaide Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005903.png"
  },
  {
    "flightNumber": "GG234",
    "destination": "Darwin",
    "date": "2024-10-17",
    "airline": "Darwin Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005910.png"
  },
  {
    "flightNumber": "AH876",
    "destination": "Hobart",
    "date": "2024-10-17",
    "airline": "Hobart Airline",
    "image": "http://localhost:3000/api/flights/QQ截图20241013005917.png"
  }
]);

const searchQuery = ref('');
const selectedDate = ref('');
const searchResult = ref('');
const filteredFlights = computed(() => {
  return flights.value.filter(flight => {
    const matchesFlightNumber = flight.flightNumber.includes(searchQuery.value.toUpperCase());
    const matchesDate = selectedDate.value ? flight.date === selectedDate.value : true;
    return matchesFlightNumber && matchesDate;
  });
});

// 显示搜索结果
const showSearchResult = () => {
  searchResult.value = searchQuery.value;
};
</script>

<style scoped>
.grid-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 每行两个 */
  gap: 16px; /* 网格间距 */
  padding: 16px; /* 内边距 */
}

.grid-item {
  background: #f9f9f9; /* 项目背景 */
  border: 1px solid #ddd; /* 边框 */
  border-radius: 8px; /* 圆角 */
  padding: 10px; /* 内部填充 */
  display: flex;
  flex-direction: column; /* 垂直排列内容 */
  align-items: center; /* 水平居中 */
}

.grid-item img {
  width: 100%; /* 图片宽度 */
  height: auto; /* 自适应高度 */
  border-radius: 4px; /* 圆角 */
}

.flight-info {
  text-align: center; /* 文本居中 */
}

.search-result {
  margin: 16px 0;
  font-size: 1.2em;
  color: #333;
}

.no-results {
  margin: 16px 0;
  font-size: 1.2em;
  color: red; /* 提示色 */
}
</style>
