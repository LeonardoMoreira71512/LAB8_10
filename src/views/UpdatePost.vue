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

	created: function () {

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