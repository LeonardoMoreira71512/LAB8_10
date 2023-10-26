<template>
	<div>

	</div>
</template>

<script>

import { useUserStore } from '@/store/user'

export default {

	setup() {
		const userStore = useUserStore()
		return { userStore }
  	},

	data() {
		return {
			success: false,
			user: {},
		}
	},


	methods: {


	},
   
	mounted() {

	},
	
	computed: {

	}

}
</script>

<style scoped>

</style>