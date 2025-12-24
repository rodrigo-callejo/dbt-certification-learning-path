{#
{% set cool_string = 'WOW cool beans'%}
{% set my_second_cool_string = 'This is ninja'%}
{% set my_fav_num=26 %}
{{cool_string}} {{my_second_cool_string}} I want to write {{my_fav_num}} 
#}

{% set animals = ['rhino','lemur','dog','CATs'] %}

{{animals[0]}}
{{animals[1]}}
{{animals[2]}}
{{animals[3]}}

{%for animal in animals%}

  'my favorite animal is' {{ animal }}
    
{% endfor %}