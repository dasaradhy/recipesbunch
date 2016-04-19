class StarsInput < SimpleForm::Inputs::Base
  def input((wrapper_options))
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    stars_html="<div id='star_#{attribute_name}' class='recipe-label'>"
    val=object.send(attribute_name.to_sym)||0
    stars_html+="</div>"
    prejscript= <<-eos
    <script>
      get_star=function(position,value,readonly){
        fa_class="";
        if ( position <= value){
          fa_class="fa-star"
        }
        else if ( position-value <= 0.5){
          fa_class="fa-star-half-o"
        }
        else {
         fa_class="fa-star-o" 
        }
        star_html="<i class='fa fa-lg "+fa_class+"' ";
        if(!readonly){
          star_html+="onmouseover='set_stars($(this).parent(&quot;div.recipe-label&quot;),"+position+","+readonly+")'></i>";
        }
        else{
          star_html+="></i>";
        } 
        return star_html;
      }

      set_stars=function(starholder,value,readonly){
        html=""
        for(pos=1;pos<=5;pos++) {
          html+=get_star(pos,value,readonly)
        }
        starholder.html(html);
        starholder.next('input').val(value)
      }
    </script>
    eos
    postjscript= <<-eos
    <script>
      set_stars($('div#star_#{attribute_name}'),#{val},#{options[:read_only]||false});
    </script>
    eos

    "#{prejscript} #{stars_html} #{@builder.hidden_field(attribute_name, merged_input_options)} #{postjscript}".html_safe
  end
end