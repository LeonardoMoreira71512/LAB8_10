<template >
	<div>
		<Menu />	
		<!-- BEGIN MICROPOSTS -->




		<!-- END MICROPOSTS -->

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
			microposts: [],
			comments: [],
			user: {
				id: '', 
				name: '', 
				email: '', 
				session_id: ''
			},
			show: '',
		}
	},
	mounted() {

	},
	methods: {
		
	},
	computed: {

	}
}
</script>

<style scoped>

</style>