/**
 * Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

// This file contains style definitions that can be used by CKEditor plugins.
//
// The most common use for it is the "stylescombo" plugin, which shows a combo
// in the editor toolbar, containing all styles. Other plugins instead, like
// the div plugin, use a subset of the styles on their feature.
//
// If you don't have plugins that depend on this file, you can simply ignore it.
// Otherwise it is strongly recommended to customize this file to match your
// website requirements and design properly.

CKEDITOR.stylesSet.add( 'default', [
	{ name: 'Título', element: 'h3', attributes: { 'class':'titulo blue'}},
	{ name: 'Subtítulo', element: 'h4', attributes: { 'class':'subtitulo dark-grey'}},
        { name: 'Entradilla', element: 'p', attributes: { 'class':'entradilla dark-grey'}},
        { name: 'Texto Normal', element: 'p', attributes: { 'class':'normal dark-grey'}},
        { name: 'Texto Pequeño', element: 'p', attributes: { 'class':'listas dark-grey'}},
        { name: 'Texto Asterisco', element: 'p', attributes: { 'class':'small-text dark-grey'}}
] );

