<template>
  <div>
  <home />
  </div>
</template>

<script>

  import home from '../components/Home'

  export default {
    name: 'HOME',
    components: {
      home,
    },
    data() {
      return {
        msg: '',
        alert:true
      };
    },
  }
</script>