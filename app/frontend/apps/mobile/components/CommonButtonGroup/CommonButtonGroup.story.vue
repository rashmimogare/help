<!-- Copyright (C) 2012-2022 Zammad Foundation, https://zammad-foundation.org/ -->

<script setup lang="ts">
import CommonButtonGroup from './CommonButtonGroup.vue'

// eslint-disable-next-line no-alert
const alert = () => window.alert('click')
</script>

<template>
  <Story>
    <CommonButtonGroup
      :options="[
        { label: 'link %s', labelPlaceholder: ['text'], link: '/example' },
        { label: 'button', onAction: alert, selected: true },
        { label: 'with-icon', onAction: alert, icon: 'home', disabled: true },
      ]"
    />
  </Story>
</template>
