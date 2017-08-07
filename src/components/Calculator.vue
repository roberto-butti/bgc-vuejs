<<template>
  
<div class="box is-info">
    <p>

Calculator
<input v-model.number="rpm" type="number">
<img src="../assets/img/bike-crankset.svg" width="64" alt="Crankset"/>
<input v-model.number="crankset" type="number">
<img src="../assets/img/bike-gears.svg" width="64" alt="Gears (Casette)"/>
<input v-model.number="cassette" type="number">
<img class="imagerotate" src="../assets/img/bike-spokes.svg" width="64" alt="Wheel Diameter">
<animateTransform attributeType="xml"
attributeName="transform"
type="rotate"
from="0 180 50"
to="360 180 50"
dur="4s"
repeatCount="indefinite"/>

</img>
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

<<style>
.imagerotate {
    /* position: absolute; 
    top: 50%;
    left: 50%;
    width: 120px;
    height: 120px;
    
    margin:-60px 0 0 -60px;
    */
    -webkit-animation:spin 4s linear infinite;
    -moz-animation:spin 4s linear infinite;
    animation:spin 4s linear infinite;
}
@-moz-keyframes spin { 100% { -moz-transform: rotate(360deg); } }
@-webkit-keyframes spin { 100% { -webkit-transform: rotate(360deg); } }
@keyframes spin { 100% { -webkit-transform: rotate(360deg); transform:rotate(360deg); } }
    
</style>