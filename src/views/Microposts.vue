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
						<p v-if="!userIsEmpty && micropost.user_id === user.id">
							<router-link class="btn custom-btn float-end" :to="'/updatePost/' + micropost.id"
								role="button">Update</router-link>
						</p>
						<p v-if="!userIsEmpty && micropost.user_id != user.id">
							<router-link class="btn custom-btn float-end" :to="'/commentPost/' + micropost.id"
								role="button">Comment Post</router-link>
						</p>
					</div>
					<div v-if="micropost.id === show">
						<div v-if="visibleComments && visibleComments.length">
							<ul v-for="comment in visibleComments" :key="comment.id">
								<li>
								<div class="card comment-card">
	        						<div class="card-header">
	            						Comment by: {{ comment.user_name }} on {{ comment.created_at }}
	       							</div>
	       							 <div class="card-body">
	            						{{ comment.content }}
	        						</div>
	    						</div>
								</li>
							</ul>
						</div>
						<!-- Mostrar a mensagem "No Comments" se não houver comentários -->
						<div v-else class="no-comments">
							<p>No Comments</p>
						</div>
					</div>
					<div v-if="micropost.id != show" class="show-comments">
						<a @click="showComments(micropost.id)" class="btn-show-comments" role="button">Show
							Comments</a>
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
		this.commentsStore.getCommentsInDB()
	},
	methods: {
		showComments(postId) {
			if (this.show === postId) {
				this.show = null;
			} else {
				this.show = postId;
			}
		},
	},
	computed: {
		microposts() {
			return this.micropostsStore.getMicroposts;
		},
		user() {
			return this.userStore.getUser;
		},
		comments() {
			return this.commentsStore.getPostComments(id);
		},
		visibleComments() {
			if (this.show) {
				return this.commentsStore.getPostComments(this.show);
			}
			return [];
		},
		userIsEmpty: function () {
			let obj = this.userStore.getUser
			return Object.keys(obj).length === 0;
		}
	}
}
</script>

<style scoped>

.custom-btn {
    background-color: #470b9a93;
    color: white;
    border: none;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.custom-btn:hover {
    background-color: #470b9a;
    color: white;
}
.no-comments {
    background-color: #fff3cd;
    color: rgba(89, 9, 5, 0.786);
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-top: 10px;
    text-align: center;
    font-weight: bold;
}

.show-comments {
    text-align: center;
    margin-top: 10px;
	padding: 0 15px;
}

.btn-show-comments {
    background-color: rgb(13, 149, 154);
    color: rgb(255, 255, 255);
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
	width: 100%;
}

.btn-show-comments:hover {
    background-color: #367c6f;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.comment-card {
    background-color: #d7d7d7;
    border-radius: 10px;
    margin-top: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border: none;
}

.comment-card .card-header {
    background-color: #1919c993;
    color: white;
    padding: 10px;
    font-weight: bold;
}

.comment-card .card-body {
    padding: 15px;
    color: #333;
    font-size: 1rem;
}

</style>