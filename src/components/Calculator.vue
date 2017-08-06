<<template>
  
<div class="box is-info">
    <p>

Calculator
<input v-model.number="rpm" type="number">
<img src="../assets/img/bike-crankset.svg" width="64" alt="Crankset"/>
<input v-model.number="crankset" type="number">
<img src="../assets/img/bike-gears.svg" width="64" alt="Gears (Casette)"/>
<input v-model.number="cassette" type="number">
<img src="../assets/img/bike-spokes.svg" width="64" alt="Wheel Diameter"/>
<input v-model.number="diameter_wheel" type="number">
{{ rpm }}
{{ crankset }}
{{ cassette }}
{{ diameter_wheel }}
{{ crankset/cassette }}
{{ (((crankset/cassette)*diameter_wheel*rpm)/1000000)*60 }} kilometer per hour


    </p>
</div>
</template>

<<script>
export default {
data () {
    return {
        rpm:70,
        crankset:50,
        cassette:11,
        diameter_wheel:2098.58 // ( 622 + 23 + 23 ) * PI
        }
      
  }
}
</script>

<<style lang="sass">
    
    
</style>