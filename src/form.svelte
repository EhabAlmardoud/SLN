<script>
    import {emailsData} from './store.js'

	let newEmail = ''
    let valid = false
    let change_count = 0
    let format = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    const checkValidation = () =>{
        if(newEmail.match(format)){
            valid= true
        }else {valid = false}
    }

    const emailSubmit = (ev) =>{
        ev.preventDefault()
        emailsData.update(ex => {
			return [...ex, newEmail]
		})
        newEmail = ''
        valid = false
        change_count = 0
    }
</script>

<style>
    .form_con{
        margin: 2vw;
    }
    .email_input{
        margin: 5px;
        padding: 10px;
        border-radius: 8px;
        font-family: inherit;
	    font-size: inherit;
        outline: none;
    }
    .error{
        color: rgb(197, 44, 33);
    }

</style>

<div class="form_con">
    <form on:submit={emailSubmit}>
        <div>
            <input type="text" class="email_input" bind:value={newEmail}
            on:input={checkValidation} on:change={()=>change_count += 1}/>
            <button type='submit' value='add email' disabled={!valid}>Add</button>
        </div>
        {#if change_count > 0 && !valid}
        <div class='error'>
            The email formate is not corret (example@example.com)
        </div>
        {/if}
    </form>
</div>