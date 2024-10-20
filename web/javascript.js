let preferenceid = 1;
let incar = false;

var hudSettings = [
  (health = {
    name: "health",
    show: true,
    value: 95,
  }),
  (armor = {
    name: "armor",
    show: true,
    value: 100,
  }),
  (food = {
    name: "food",
    show: true,
    value: 95,
  }),
  (water = {
    name: "water",
    show: true,
    value: 95,
  }),
  (oxygen = {
    name: "oxygen",
    show: true,
  }),
  (minimap = {
    name: "minimap",
    show: true,
  }),
  (harness = {
    name: "harness",
    show: true,
  }),
  (nitrous = {
    name: "nitrous",
    show: true,
  }),
  (speedometerFps = {
    name: "speedometerFps",
    value: 60,
  }),
];

$(document).ready(function () {
  $("._tab_1hwi9_98").click(function () {
    if ($(this).hasClass("_active_1hwi9_175")) {
      return;
    } else {
      $("._active_1hwi9_175").addClass("false");
      $(this).removeClass("false");
      $("._active_1hwi9_175").removeClass("_active_1hwi9_175");
      $(this).addClass("_active_1hwi9_175");

      $("._options_1hwi9_191").css("display", "none");
      $("._options_1hwi9_191[menuid=" + $(this).attr("menuid") + "]").css(
        "display",
        "flex"
      );
    }
  });

  $(".np-switch").on("input", function (e) {
    if ($(this).is(":checked")) {
      $(this).parent().children("label").addClass("enabled");
    } else {
      $(this).parent().children("label").removeClass("enabled");
    }
  });

  $(".settings-dropdown").click(function () {
    if ($(this).children(".options").css("display") == "none") {
      $(this).children(".options").css("display", "flex");
    } else {
      $(this).children(".options").css("display", "none");
    }
  });

  $(".option").click(function () {
    let Description = $(this).html();
    $(this)
      .parent()
      .parent()
      .children(".np-text-box")
      .prop("value", Description);
    if (
      $(this).parent().parent().children(".np-text-box").attr("trink") ==
      "preference"
    ) {
      loadPreference();
    }
  });

  $("._saveButton_1hwi9_61").click(function () {
    if ($("._options_1hwi9_191[menuid=hud]").css("display") == "flex") {
      saveSettings();
    } else if (
      $("._options_1hwi9_191[menuid=gameplay]").css("display") == "flex"
    ) {
      localStorage.setItem("hud_crosshair", $(".crosshairCb").is(":checked"));
      $.post(
        "https://exter-hud/crosshair",
        JSON.stringify({
          active: $(".crosshairCb").is(":checked"),
        })
      );
    }
  });

  $(".black-bar-input").keyup(function (e) {
    var val = $(this).val();
    $(".black-bar").css("height", `${val}%`);
  });

  if ($(".black-bar-checkbox").is(":checked")) {
    $(".black-bar").css("display", "block");
  } else {
    $(".black-bar").css("display", "none");
  }

  $(".black-bar-checkbox").click(function () {
    if ($(this).is(":checked")) {
      $(".black-bar").css("display", "block");
      $.post(
        "https://exter-hud/blackbar",
        JSON.stringify({
          show: true,
        })
      );
    } else {
      $(".black-bar").css("display", "none");
      $.post(
        "https://exter-hud/blackbar",
        JSON.stringify({
          show: false,
        })
      );
    }
  });
});

function loadPreference() {
  if (localStorage.getItem("hud_crosshair")) {
    $(".crosshairCb").prop(
      "checked",
      JSON.parse(localStorage.getItem("hud_crosshair"))
    );
    $.post(
      "https://exter-hud/crosshair",
      JSON.stringify({
        active: JSON.parse(localStorage.getItem("hud_crosshair")),
      })
    );
  } else {
    localStorage.setItem("hud_crosshair", $(".crosshairCb").is(":checked"));
    $.post(
      "https://exter-hud/crosshair",
      JSON.stringify({
        active: $(".crosshairCb").is(":checked"),
      })
    );
  }


  preferenceid = $(".np-text-box[trink=preference]").val();
  if (localStorage.getItem("hudSettings_" + preferenceid)) {
    hudSettings = JSON.parse(
      localStorage.getItem("hudSettings_" + preferenceid)
    );
    for (let i = 0; i < hudSettings.length; i++) {
      changeHudSettingInputs(hudSettings[i]);
    }
  } else {
    localStorage.setItem(
      "hudSettings_" + preferenceid,
      JSON.stringify(hudSettings)
    );
  }
}

function changeHudSettingInputs(data) {
  if (
    data.name == "health" ||
    data.name == "armor" ||
    data.name == "food" ||
    data.name == "water"
  ) {
    $("." + data.name + "_input").prop("checked", data.show);
    $("." + data.name + "_input")
      .parent()
      .parent()
      .children(".settings-input-container")
      .children("input")
      .prop("value", data.value);
  } else if (
    data.name == "oxygen" ||
    data.name == "harness" ||
    data.name == "nitrous"
  ) {
    $(".np-switch[name=" + data.name + "]").prop("checked", data.show);
  } else if (data.name == "speedometerFps") {
    $(".np-text-box[name=speedometerFps]").val(data.value);
    $.post(
      "https://exter-hud/speedometerfps",
      JSON.stringify({
        fps: data.value,
      })
    );
  } else if (data.name == "minimap") {
    $(".np-switch[name=" + data.name + "]").prop("checked", data.show);
    $.post(
      "https://exter-hud/minimapenabled",
      JSON.stringify({
        active: data.show,
      })
    );
  }

  refreshInputs();
}

function saveSettings() {
  $(".settings-switch-wrapper").each(function (e) {
    for (let i = 0; i < hudSettings.length; i++) {
      if (hudSettings[i].name == $(this).children("input").attr("name")) {
        hudSettings[i].show = $(this).children("input").is(":checked");
        let name = $(this).children("input").attr("name");
        if (
          name == "health" ||
          name == "armor" ||
          name == "food" ||
          name == "water"
        ) {
          hudSettings[i].value = $("." + name + "_input")
            .parent()
            .parent()
            .children(".settings-input-container")
            .children("input")
            .prop("value");
        }
      }
    }
  });
  for (let i = 0; i < hudSettings.length; i++) {
    if (hudSettings[i].name == "speedometerFps") {
      hudSettings[i].value = $(".np-text-box[name=speedometerFps]").val();
      $.post(
        "https://exter-hud/speedometerfps",
        JSON.stringify({
          fps: hudSettings[i].value,
        })
      );
    } else if (hudSettings[i].name == "minimap") {
      $.post(
        "https://exter-hud/minimapenabled",
        JSON.stringify({
          active: hudSettings[i].show,
        })
      );
    }
  }
  localStorage.setItem(
    "hudSettings_" + preferenceid,
    JSON.stringify(hudSettings)
  );
}

function refreshInputs() {
  $(".settings-switch-wrapper").each(function (e) {
    if ($(this).children("input").is(":checked")) {
      $(this).children("label").addClass("enabled");
    } else {
      $(this).children("label").removeClass("enabled");
    }
  });
}

// STATUS HUD

function updateBar(name, value) {
  $(".icon-cont[name=" + name + "")
    .children()
    .css("background-size", "100% " + value + "%");
  if (
    name == "database" ||
    name == "wind" ||
    name == "exclamation" ||
    name == "lightbulb" ||
    name == "dollar"
  ) {
    if (value <= 0) {
      $(".icon-cont[name=" + name + "")
        .parent()
        .parent()
        .css("display", "none");
    } else {
      $(".icon-cont[name=" + name + "")
        .parent()
        .parent()
        .css("display", "block");
    }
  } else {
    for (let i = 0; i < hudSettings.length; i++) {
      if (hudSettings[i].name == name) {
        if (
          (value >= hudSettings[i].value && hudSettings[i].value != 100) ||
          hudSettings[i].show == false ||
          value == false
        ) {
          $(".icon-cont[name=" + name + "")
            .parent()
            .parent()
            .css("display", "none");
        } else {
          $(".icon-cont[name=" + name + "")
            .parent()
            .parent()
            .css("display", "block");
        }
      }
    }
  }
}

// CARHUD

function updateSpeed(veri) {
  if (veri.toString().length == 3) {
    var a = veri.toString().charAt(0);
    var b = veri.toString().charAt(1);
    var c = veri.toString().charAt(2);

    $(".speedometera:eq(0)").html(a);
    $(".speedometera:eq(1)").html(b);
    $(".speedometera:eq(2)").html(c);

    $(".speedometera:eq(0)").css("color", "white");
    $(".speedometera:eq(1)").css("color", "white");
    $(".speedometera:eq(2)").css("color", "white");
  } else if (veri.toString().length == 2) {
    var a = veri.toString().charAt(0);
    var b = veri.toString().charAt(1);

    $(".speedometera:eq(0)").html(0);
    $(".speedometera:eq(1)").html(a);
    $(".speedometera:eq(2)").html(b);

    $(".speedometera:eq(0)").css("color", "gray");
    $(".speedometera:eq(1)").css("color", "white");
    $(".speedometera:eq(2)").css("color", "white");
  } else if (veri.toString().length == 1) {
    var a = veri.toString().charAt(0);
    $(".speedometera:eq(0)").html(0);
    $(".speedometera:eq(1)").html(0);
    $(".speedometera:eq(2)").html(a);

    $(".speedometera:eq(0)").css("color", "gray");
    $(".speedometera:eq(1)").css("color", "gray");
    if (a != "0") {
      $(".speedometera:eq(2)").css("color", "white");
    } else {
      $(".speedometera:eq(2)").css("color", "gray");
    }
  }
}

function mapNumber(number, fromMin, fromMax, toMin, toMax) {
  return ((number - fromMin) * (toMax - toMin)) / (fromMax - fromMin) + toMin;
}

function rpmUpdate(rpm) {
  let mappedNumber = mapNumber(rpm * 10, 0, 10, 0, 17) + 1;
  $(".rpm-hud").each(function (index) {
    if (index < mappedNumber) {
      $(this)
        .addClass("ring-mediumspringgreen bg-mediumspringgreen")
        .removeClass("bg-neutral-600 ring-neutral-600");
      if (index <= 17 && index >= 15) {
        $(this).addClass("bg-red-500");
      }
    } else {
      $(this)
        .addClass("bg-neutral-600 ring-neutral-600")
        .removeClass("ring-mediumspringgreen bg-mediumspringgreen");
      if (index <= 17 && index >= 15) {
        $(this).removeClass("bg-red-500");
      }
    }
  });
}

function updateGear(gear) {
  if (gear == 0) {
    gear = "R";
  }
  $("#gearText").html(gear);
}

function updateFuel(a) {
  $("#fuelLevel1").css("height", a + "%");
}

function updatePursuit(a) {
  $("#pursuitMode").css("height", a + "%");
}




// INGAME  pursuitMode

window.addEventListener('message', function(event) {
  var fuelLevel1 = document.getElementById('fuelLevel1');
  var iconElement1 = document.getElementById('vehicleIcon1');
  var iconElement2 = document.getElementById('vehicleIcon2');

  var fuelLevel2 = document.getElementById('fuelLevel2');
  var iconElement3 = document.getElementById('vehicleIcon3');
  var iconElement4 = document.getElementById('vehicleIcon4');

  var pursuitMode = document.getElementById('PursuitMode');
  var pursuitModeIcon = document.getElementById('vehicleIcon5');

  var fuelLevel2Element = fuelLevel2.parentElement.parentElement;
  var pursuitModeElement = pursuitMode.parentElement.parentElement;

  if (event.data.action === 'enteredElectricVehicle') {
      fuelLevel1.style.backgroundColor = 'white'; // Charger
      iconElement1.style.display = "block";
      iconElement2.style.display = "none";

      fuelLevel2.style.backgroundColor = '#a95521'; // Battery
      fuelLevel2.style.height = event.data.vehicleIcon1Value + '%';
      iconElement3.style.display = "block";
      iconElement4.style.display = "none";
      fuelLevel2.parentElement.style.display = "flex"; // second bar and icons

      fuelLevel2Element.style.order = "1";
      pursuitModeElement.style.order = "2";   

  } if (event.data.action === 'enteredNonElectricVehicle') {
    fuelLevel1.style.backgroundColor = 'white';
    iconElement1.style.display = "none";
    iconElement2.style.display = "block";
  
    fuelLevel2.parentElement.style.display = "none"; // Hiding when car not electric
    iconElement3.style.display = "none"; 
    iconElement4.style.display = "none"; 

    fuelLevel2Element.style.order = "2";
    pursuitModeElement.style.order = "1";

} else if (event.data.action === 'PoliceVehicle') {
    pursuitMode.style.height = event.data.pursuit + '%';
    pursuitMode.style.backgroundColor = '#ef4444';
    pursuitMode.parentElement.style.display = "flex";
    pursuitMode.style.display = 'block'; 
    pursuitModeIcon.style.display = 'block';
} else if (event.data.action === 'NoPoliceVehicle') {
    pursuitMode.parentElement.style.display = "none";
    pursuitMode.style.display = 'none';
    pursuitModeIcon.style.display = 'none';
}
if (event.data.action === 'radioConnected' && event.data.wireless !== undefined) {
  document.getElementById("radio-icon").style.display = event.data.wireless ? "block" : "none";
  
  if (event.data.number !== undefined) {
    document.querySelector('.inter500.p-black62').textContent = event.data.number;
  
  }

  
}
  if (event.data.action === 'carHudUpdate') {
    pursuitMode.style.height = event.data.pursuit + '%';
  }

});



window.addEventListener("message", function (event) {

  if (event.data.action == "refreshStatus") {
    updateBar("health", event.data.health);
    updateBar("armor", event.data.armor);
    updateBar("food", event.data.food);
    updateBar("water", event.data.water);
    updateBar("oxygen", event.data.oxy);
    if (incar) {
      updateBar("nitrous", event.data.nitrous);
      updateBar("harness", event.data.harness);
    } else {
      updateBar("nitrous", false);
      updateBar("harness", false);
    }
  } else if (event.data.action == "enchantmentNui") {
  
    updateBar(event.data.name, event.data.value);
  } else if (event.data.action == "openMenu") {
    $("._container_1hwi9_2").css("display", "block");
  } else if (event.data.action == "refreshPreference") {
    $(".np-text-box[trink=preference]").prop("value", event.data.preference);
    if (event.data.guides) {
      $("._options_1hwi9_191[menuid=help]").html("");
      for (let i = 0; i < event.data.guides.length; i++) {
        let html = `
                <div class="_option_1hwi9_191">
                    <div class="_texts_1hwi9_215">
                    <div class="_title_1hwi9_44">${event.data.guides[i].Title}</div>
                    <div class="_description_1hwi9_53">${event.data.guides[i].Description}</div>
                    </div>
                </div>
                `;
        $("._options_1hwi9_191[menuid=help]").append(html);
      }
    }
    loadPreference();
    } else if (event.data.action == "carHud") {
    if (event.data.open) {
      $("#carhud").css("display", "block");
      $("#pusula").css("display", "flex");
      incar = true;
    } else {
      $("#carhud").css("display", "none");
      $("#pusula").css("display", "none");
      incar = false;
    }
  } else if (event.data.action == "carHudUpdate") {
    updateSpeed(event.data.speed);
    rpmUpdate(event.data.rpm);
    updateGear(event.data.gear);
    updateFuel(event.data.fuel);
    updatePursuit(event.data.pursuit);

    if (event.data.seatbelt) {
      $("#seatbelt").css("display", "none");
      $("#seatbelt").removeClass("pulsate");
    } else {
      $("#seatbelt").css("display", "block");
      $("#seatbelt").addClass("pulsate");
    }
  } else if (event.data.action == "updatePusula") {
    $("#streetName").html(
      event.data.locinfo.street1 + ", " + event.data.locinfo.street2
    );
    $("#zoneName").html(event.data.locinfo.zoneLabel);
    $("#pusulaimg").css(
      "background",
      "url(compas.png) " +
        event.data.locinfo.myHeading / 11 +
        "vh 0px / 100% repeat-x"
    );
    if (event.data.locinfo.waypointActive) {
      $("#waypointPusula").css("display", "block");
      let heading =
        event.data.locinfo.waypointHeading / 3 -
        event.data.locinfo.myHeading / 3;
      heading = heading * -1;
      if (heading >= 15) {
        heading = 15;
      } else if (heading <= -15) {
        heading = -15;
      }
      $("#waypointPusula").css("transform", "translateX(" + heading + "vh)");
    } else {
      $("#waypointPusula").css("display", "none");
    }
  } else if (event.data.action == "changeVoiceMode") {
    if (event.data.voiceMode == 0) {
      $(".icon-cont[name=voice]")
        .children()
        .css("background-size", "100% " + 45 + "%");
    } else if (event.data.voiceMode == 1) {
      $(".icon-cont[name=voice]")
        .children()
        .css("background-size", "100% " + 70 + "%");
    } else {
      $(".icon-cont[name=voice]")
        .children()
        .css("background-size", "100% " + 100 + "%");
    }
  } else if (event.data.action == "talking") {
    if (event.data.talking) {
      if (event.data.radioshit) {
        $(".icon-cont[name=radio]")
          .parent()
          .css("background", "rgba(185, 65, 65, 0.5)");
        $(".icon-cont[name=radio]").css(
          "background",
          "radial-gradient(rgba(185, 65, 65, 0.5), rgba(185, 65, 65, 0.5))"
        );
        $(".icon-cont[name=radio]")
          .children()
          .css(
            "background-image",
            " radial-gradient(rgba(185, 65, 65, 0.5), rgba(185, 65, 65, 0.5))"
          );
      } else {
        $(".icon-cont[name=voice]")
          .parent()
          .css("background", "rgba(255, 238, 0, 0.35)");
        $(".icon-cont[name=voice]").css(
          "background",
          "radial-gradient(rgba(255, 217, 0, 0), rgba(255, 251, 0, 0.5))"
        );
        $(".icon-cont[name=voice]")
          .children()
          .css(
            "background-image",
            " radial-gradient(rgba(255, 208, 0, 0.5), rgba(255, 238, 0, 0.5))"
          );
      }
    } else {
      $(".icon-cont[name=voice]")
        .parent()
        .css("background", "rgba(255, 255, 255, 0.35)");
      $(".icon-cont[name=voice]").css(
        "background",
        "radial-gradient(rgba(132, 132, 132, 0), rgba(255, 255, 255, 0.5))"
      );
      $(".icon-cont[name=voice]")
        .children()
        .css(
          "background-image",
          " radial-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5))"
        );

        $(".icon-cont[name=radio]")
        .parent()
        .css("background", "rgba(255, 255, 255, 0.35)");
      $(".icon-cont[name=radio]").css(
        "background",
        "radial-gradient(rgba(132, 132, 132, 0), rgba(255, 255, 255, 0.5))"
      );
      $(".icon-cont[name=radio]")
        .children()
        .css(
          "background-image",
          " radial-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5))"
        );
    }

    // RADIO NUMBER
    
    
  
  } else if (event.data.action == "parachute") {
    if (event.data.active) {
      $("#parachute").css("display", "block");
    } else {
      $("#parachute").css("display", "none");
    }
  } else if (event.data.action == "dev") {
    if (event.data.active) {
      $("#dev").css("display", "block");
    } else {
      $("#dev").css("display", "none");
    }
  } else if (event.data.action == "xHair") {
    if (event.data.active) {
      $(".crosshair").css("display", "block");
    } else {
      $(".crosshair").css("display", "none");
    }
  } else if (event.data.action == "debug") {
    if (event.data.active) {
      $("#debug").css("display", "block");
    } else {
      $("#debug").css("display", "none");
    }
  } else if (event.data.action == "god") {
    if (event.data.active) {
      $("#god").css("display", "block");
    } else {
      $("#god").css("display", "none");
    }
  }
  else if (event.data.action == "lowfuel") {
    if (event.data.active) {
      $("#lowfuel").css("display", "block");
    } else {
      $("#lowfuel").css("display", "none"); 
    }
  }  
  else if (event.data.action == "engine") {
    if (event.data.active) {
      $("#engine").css("display", "block");
    } else {
      $("#engine").css("display", "none");
    }
  }   

});

$(document).keyup(function (e) {
  if (e.key === "Escape") {
    $.post("https://exter-hud/closeMenu");
    $("._container_1hwi9_2").css("display", "none");
  }
});


