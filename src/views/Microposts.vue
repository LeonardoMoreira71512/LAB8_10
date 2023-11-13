<template >
	<div>
		<Header />	
		<!-- BEGIN MICROPOSTS -->




		<!-- END MICROPOSTS -->

		<Footer />

	</div>
</template>

<script>
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

import { useMicropostsStore } from '@/store/microposts'
import { useUserStore } from '@/store/user'
import { useCommentsStore } from '@/store/comments'

export default {

	setup() {
		const userStore = useUserStore()
		const micropostsStore = useMicropostsStore()
		const commentsStore = useCommentsStore()
		return { userStore, commentsStore, micropostsStore }
  	},

	components: {
		Footer,
        Header
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