<template>
    <div>
        <Menu />

        <Footer />
    </div>

</template>

<script>
import Footer from '@/components/Footer.vue'
import Menu from '@/components/Menu.vue'

import { useUserStore } from '@/store/user'
import { useMicropostsStore } from '@/store/microposts'

export default { 

	setup() {
		const userStore = useUserStore()
		const micropostsStore = useMicropostsStore()
		return { userStore, micropostsStore}
  	},

    components: {
		Footer,
        Menu
	},	
	data() {
      return {
		submitting: false,
		error: false,
        post: {
            id:"",
            content:"",
            user_id:"",        
            author:"", 
            created_at:"",   
            updated_at:"", 
            likes:"",                             
        },
		user: {
			id: '', 
			name: '', 
			email: '', 
			session_id: ''
		},
      }
    },

	mounted() {

	},
	
	methods: {
        
	},


	
	computed: {

	},
	directives: {

	},
}
</script>

<style scoped>



</style>