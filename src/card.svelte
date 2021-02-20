<script>
    export let email
	import {emailsData} from './store.js'

    const handleDelete = () => {
        emailsData.update(ex=>{
            let temp = [...ex]
            const ind = temp.indexOf(email)
            temp.splice(ind, 1)
            return [...temp]
        })
    }
</script>

<style>
    .card{
        margin: 20px 80px;
        display: flex;
        justify-content: center;
    }
    .card_cont{
        width: 50%;
        display: flex;
        align-items: baseline;
        padding: 5px;
        border-bottom: 2px solid #253a96;
        border-radius: 5px;
    }
    .delete_button{
        margin: 10px;
        color: rgb(197, 44, 33);
        border: 3px rgb(197, 44, 33) solid;
    }
</style>

<div class='card'>
    <div class='card_cont'>
        <button class='delete_button' on:click={handleDelete}>X</button>
        {email}
    </div>
</div>