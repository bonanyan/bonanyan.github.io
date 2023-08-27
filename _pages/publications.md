---
layout: page
permalink: /publications/
title: Publication
description: List of Our Hard Work
years: [2023,2022,2021]
nav: false
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">
<a href="bib.bib">bibtex file</a>
{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f {{ site.scholar.bibliography }} -q @*[year={{y}}]* %}
{% endfor %}

</div>
