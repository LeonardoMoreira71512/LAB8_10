<template >
	<div>
		<Header />
		<div id="carouselExampleCaptions" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
					aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
					aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
					aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active c-item">
					<img src="../assets/images/trip10.jpeg" class="rounded-circle d-block w-100 c-img" alt="image 1">
					<div class="carousel-caption d-none d-md-block">
					</div>
				</div>
				<div class="carousel-item c-item">
					<img src="../assets/images/trip7.jpeg" class="rounded-circle d-block w-100 c-img" alt="image 2">
					<div class="carousel-caption d-none d-md-block">
					</div>
				</div>
				<div class="carousel-item c-item">
					<img src="../assets/images/trip9.jpeg" class="rounded-circle d-block w-100 c-img" alt="image 3">
					<div class="carousel-caption d-none d-md-block">
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- BEGIN MICROPOSTS -->
		<div class="container mt-5">
			<div class="row justify-content-left">
				<div v-for="micropost in microposts" :key="micropost.id" class="col-md-6 mb-4">
					<div class="card"
						style="box-shadow: 0 0 30px #08c60e; background-color: #d7d7d7fe; border-radius: 20px;">
						<div class="card-header" style="background-color: rgb(100, 107, 107); font-size: large;">
							<h6 class="card-subtitle mb-2 text-white" style="display: inline;"> created at
								{{ micropost.created_at }}</h6>
							<h6 class="card-subtitle mb-2 text-white"> updated at {{ micropost.updated_at }}</h6>
							<div class="text-right" style="display: inline; float: left;">
								Posted by: {{ micropost.name }}
							</div>
						</div>
						<div class="card-body">
							{{ micropost.content }}
						</div>
						<p v-if="micropost.user_id === user.id">
							<router-link class="btn btn-primary btn-sm float-end" :to="'/updatePost/' + micropost.id"
								role="button">Update</router-link>
						</p>
					</div>
				</div>
				<!-- Add more cards here as needed -->
			</div>
		</div>
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
		Header,
	},
	data() {
		return {
			comments: [],
			show: [],
			alert: false,
			clickId: '',
		}
	},
	mounted() {
		this.micropostsStore.getMicropostsInDB()
	},
	methods: {
	},
	computed: {
		microposts() {
			return this.micropostsStore.getMicroposts;
		},
		user() {
			return this.userStore.getUser;
		}
	}
}
</script>

<style scoped></style>