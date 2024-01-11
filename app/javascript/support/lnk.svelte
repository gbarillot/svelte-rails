<script>
  import { routes } from '@/admin/routes'

  export let to;
  export let params;
  export let attrs;
  export let data;

  const targetRoute = routes.find(route => route.label === to);
  
  function replacePlaceholders(obj, pattern) {
    return pattern.replace(/:\w+/g, function (match) {
      const key = match.substring(1); 
      return obj.hasOwnProperty(key) ? obj[key] : match;
    })
  }

  const pathWithParams = params === undefined ? targetRoute.name : replacePlaceholders(params, targetRoute.name);
  const prefix = window.I18n.locale === window.I18n.availableLocales[0] ? '' : `/${window.I18n.prefix}`
  const finalPath = `${prefix}${pathWithParams}`
 
  const htmlAttrs = attrs === undefined ? {} : attrs
  let dataAttrs = {};
  if(data != undefined) {
    dataAttrs = Object.keys(data).reduce((acc, key) => {
      acc[`data-${key}`] = data[key];
      return acc;
    }, {});
  }    
</script>

<a href={finalPath} {...htmlAttrs} {...dataAttrs}><slot></slot></a>
