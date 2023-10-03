<template>
<div>

    <Menu />



    <Footer />

</div>
</template>

<script>

import Footer from '@/components/Footer.vue'
import Menu from '@/components/Menu.vue'

export default {
	components: {
		Footer,
        Menu
	},   
	data() {
      return {	
        user: {
			email: '',
			password: '',
        },
		submitting: false,
		error: false,
      }
    },
	
	methods: {

	},
	
	computed: {

	},
	directives: {

	},
	created() {

	}
}
</script>

<style scoped>

</style>